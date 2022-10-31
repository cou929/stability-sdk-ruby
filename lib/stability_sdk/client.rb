require "grpc"
require "generation_services_pb"
require "logger"

module StabilitySDK
  class Client
    DEFAULT_API_HOST = "grpc.stability.ai:443"
    DEFAULT_IMAGE_WIDTH = 512
    DEFAULT_IMAGE_HEIGHT = 512
    DEFAULT_SAMPLE_SIZE = 1
    DEFAULT_STEPS = 50
    DEFAULT_ENGINE_ID = "stable-diffusion-v1-5"
    DEFAULT_CFG_SCALE = 7.0
    DEFAULT_SAMPLER_ALGORITHM = Gooseai::DiffusionSampler::SAMPLER_K_LMS
    DEFAULT_START_SCHEDULE = 1.0
    DEFAULT_END_SCHEDULE = 0.01

    SAMPLER_ALGORITHMS = {
      "ddim": Gooseai::DiffusionSampler::SAMPLER_DDIM,
      "plms": Gooseai::DiffusionSampler::SAMPLER_DDPM,
      "k_euler": Gooseai::DiffusionSampler::SAMPLER_K_EULER,
      "k_euler_ancestral": Gooseai::DiffusionSampler::SAMPLER_K_EULER_ANCESTRAL,
      "k_heun": Gooseai::DiffusionSampler::SAMPLER_K_HEUN,
      "k_dpm_2": Gooseai::DiffusionSampler::SAMPLER_K_DPM_2,
      "k_dpm_2_ancestral": Gooseai::DiffusionSampler::SAMPLER_K_DPM_2_ANCESTRAL,
      "k_lms": Gooseai::DiffusionSampler::SAMPLER_K_LMS,
    }

    def initialize(options={})
      host = options[:api_host] || DEFAULT_API_HOST
      channel_creds = options.has_key?(:ca_cert) ? GRPC::Core::ChannelCredentials.new(options[:ca_cert]) : GRPC::Core::ChannelCredentials.new
      call_creds = GRPC::Core::CallCredentials.new(proc { { "authorization" => "Bearer #{options[:api_key]}" } })
      creds = channel_creds.compose(call_creds)

      stub_params = {}
      [:channel_override, :timeout, :propagate_mask, :channel_args, :interceptors].each do |kw|
        stub_params[kw] = options[kw] if options.has_key?(kw)
      end

      if options.has_key?(:logger)
        @logger = options[:logger]
      else
        logger = Logger.new(STDOUT)
        logger.level = Logger::WARN
        @logger = logger
      end

      @stub = Gooseai::GenerationService::Stub.new(host, creds, **stub_params)
    end

    def generate(prompt, options, &block)
      width = options.has_key?(:width) ? options[:width] : DEFAULT_IMAGE_WIDTH
      height = options.has_key?(:height) ? options[:height] : DEFAULT_IMAGE_HEIGHT

      if width % 64 != 0 || height % 64 != 0
        raise InvalidParameter, "width and height must be a multiple of 64"
      end

      samples = options.has_key?(:num_samples) ? options[:num_samples] : DEFAULT_SAMPLE_SIZE
      steps = options.has_key?(:steps) ? options[:steps] : DEFAULT_STEPS
      seed = options.has_key?(:seed) ? [options[:seed]] : [rand(4294967295)]
      transform = Gooseai::TransformType.new(
        diffusion: options.has_key?(:sampler) ? SAMPLER_ALGORITHMS[options[:sampler].to_sym] : DEFAULT_SAMPLER_ALGORITHM,
      )
      step_parameter = Gooseai::StepParameter.new(
        scaled_step: 0,
        sampler: Gooseai::SamplerParameters.new(
          cfg_scale: options.has_key?(:cfg_scale) ? options[:cfg_scale] : DEFAULT_CFG_SCALE,
        ),
      )

      prompt_param = []
      if prompt != ""
        prompt_param << Gooseai::Prompt.new(text: prompt)
      end
      if options.has_key?(:init_image)
        prompt_param << init_image_to_prompt(options[:init_image])
        step_parameter.scaled_step = 0
        step_parameter.sampler = Gooseai::SamplerParameters.new(
          cfg_scale: options.has_key?(:cfg_scale) ? options[:cfg_scale] : DEFAULT_CFG_SCALE,
        )
        step_parameter.schedule = Gooseai::ScheduleParameters.new(
          start: options.has_key?(:start_schedule) ? options[:start_schedule] : DEFAULT_START_SCHEDULE,
          end: options.has_key?(:end_schedule) ? options[:end_schedule] : DEFAULT_END_SCHEDULE,
        )
      end
      if options.has_key?(:mask_image)
        prompt_param << mask_image_to_prompt(options[:mask_image])
      end

      # CLIP guidance
      if options.has_key?(:guidance_preset) && options[:guidance_preset] != "GUIDANCE_PRESET_NONE"
        step_parameter.sampler = nil

        guidance_prompt =
          if options.has_key?(:guidance_prompt)
            Gooseai::Prompt.new(text: options[:guidance_prompt])
          else
            Gooseai::Prompt.new(text: prompt)
          end

        guidance_strength = nil
        if options.has_key?(:guidance_strength) && options[:guidance_strength] != 0
          guidance_strength = options[:guidance_strength]
        end

        models = nil
        if options.has_key?(:guidance_models)
          models = options[:guidance_models].map { |m| Gooseai::Model.new(alias: m) }
        end

        cutouts = nil
        if options.has_key?(:guidance_cuts)
          cutouts = Gooseai::CutoutParameters.new(count: options[:guidance_cuts])
        end

        step_parameter.guidance = Gooseai::GuidanceParameters.new(
          guidance_preset: Gooseai::GuidancePreset.const_get(options[:guidance_preset].to_sym),
          instances: [
            Gooseai::GuidanceInstanceParameters.new(
              guidance_strength: guidance_strength,
              models: models,
              cutouts: cutouts,
              prompt: guidance_prompt,
            ),
          ],
        )

        if transform.diffusion != Gooseai::DiffusionSampler::SAMPLER_K_DPM_2_ANCESTRAL && transform.diffusion != Gooseai::DiffusionSampler::SAMPLER_K_EULER_ANCESTRAL
          transform = Gooseai::TransformType.new(
            diffusion: Gooseai::DiffusionSampler::SAMPLER_K_DPM_2_ANCESTRAL
          )
          @logger.warn "CLIP guidance is only supported with ancestral samplers. So override it with SAMPLER_K_DPM_2_ANCESTRAL."
        end
      end

      image_param = Gooseai::ImageParameters.new(
        width: width,
        height: height,
        samples: samples,
        steps: steps,
        seed: seed,
        transform: transform,
        parameters: [step_parameter],
      )

      req = Gooseai::Request.new(
        prompt: prompt_param,
        engine_id: options[:engine_id] || DEFAULT_ENGINE_ID,
        image: image_param
      )

      @logger.debug "sending request."
      start = Time.now
      @stub.generate(req).each do |answer|
        duration = Time.now - start
        if answer.artifacts.size > 0
          artifact_types = answer.artifacts.map { |a| a.type }
          @logger.debug "got #{answer.answer_id} with #{artifact_types} in #{duration.round(2)}s"
        else
          @logger.debug "got keepalive #{answer.answer_id} in #{duration.round(2)}s"
        end

        block.call(answer)

        start = Time.now
      end
    end

    def init_image_to_prompt(path)
      bin = IO.binread(path)
      return Gooseai::Prompt.new(
        artifact: Gooseai::Artifact.new(
          type: Gooseai::ArtifactType::ARTIFACT_IMAGE,
          binary: bin,
        ),
        parameters: Gooseai::PromptParameters.new(
          init: true
        ),
      )
    end

    def mask_image_to_prompt(path)
      bin = IO.binread(path)
      return Gooseai::Prompt.new(
        artifact: Gooseai::Artifact.new(
          type: Gooseai::ArtifactType::ARTIFACT_MASK,
          binary: bin,
        ),
      )
    end
  end
end
