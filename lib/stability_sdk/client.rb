require "grpc"
require "generation_services_pb"

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

    sampler_algorithms = {
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

      @stub = Gooseai::GenerationService::Stub.new(host, creds)
    end

    def generate(prompt, options, &block)
      width = options.has_key?(:width) ? options[:width].to_i : DEFAULT_IMAGE_WIDTH
      height = options.has_key?(:height) ? options[:height].to_i : DEFAULT_IMAGE_HEIGHT
      samples = options.has_key?(:num_samples) ? [:num_samples].to_i : DEFAULT_SAMPLE_SIZE
      steps = options.has_key?(:steps) ? options[:steps].to_i : DEFAULT_STEPS
      seed = options.has_key?(:seed) ? [options[:seed]].to_i : [rand(4294967295)]
      transform = Gooseai::TransformType.new(
        diffusion: options.has_key?(:sampler) ? sampler_algorithms[options[:sampler]] : DEFAULT_SAMPLER_ALGORITHM,
      )
      parameters = [Gooseai::StepParameter.new(
        scaled_step: 0,
        sampler: Gooseai::SamplerParameters.new(
          cfg_scale: options.has_key?(:cfg_scale) ? options[:cfg_scale].to_f : DEFAULT_CFG_SCALE,
        ),
      )]

      prompt_param = []
      if prompt != ""
        prompt_param << Gooseai::Prompt.new(text: prompt)
      end
      if options.has_key?(:init_image)
        prompt_param << init_image_to_prompt(options[:init_image])
        parameters = [Gooseai::StepParameter.new(
          scaled_step: 0,
          sampler: Gooseai::SamplerParameters.new(
            cfg_scale: options.has_key?(:cfg_scale) ? options[:cfg_scale].to_f : DEFAULT_CFG_SCALE,
          ),
          schedule: Gooseai::ScheduleParameters.new(
            start: options.has_key?(:start_schedule) ? options[:start_schedule].to_f : DEFAULT_START_SCHEDULE,
            end: options.has_key?(:end_schedule) ? options[:end_schedule].to_f : DEFAULT_END_SCHEDULE,
          ),
        )]
      end
      if options.has_key?(:mask_image)
        prompt_param << mask_image_to_prompt(options[:mask_image])
      end

      image_param = Gooseai::ImageParameters.new(
        width: width,
        height: height,
        samples: samples,
        steps: steps,
        seed: seed,
        transform: transform,
        parameters: parameters,
      )

      req = Gooseai::Request.new(
        prompt: prompt_param,
        engine_id: options[:engine_id] || DEFAULT_ENGINE_ID,
        image: image_param
      )

      @stub.generate(req).each do |answer|
        block.call(answer)
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
