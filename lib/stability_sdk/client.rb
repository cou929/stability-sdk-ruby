require "grpc"
require "generation_services_pb"

module StabilitySDK
  class Client
    DEFAULT_API_HOST = "grpc.stability.ai:443"
    DEFAULT_IMAGE_WIDTH = 512
    DEFAULT_IMAGE_HEIGHT = 512
    DEFAULT_SAMPLE_SIZE = 1
    DEFAULT_STEPS = 50
    DEFAULT_ENGINE_ID = "stable-diffusion-v1"

    def initialize(options={})
      raise InsufficientParameter, "api_key is required" unless options.has_key?(:api_key)

      host = options[:api_host] || DEFAULT_API_HOST
      channel_creds = options.has_key?(:ca_cert) ? GRPC::Core::ChannelCredentials.new(options[:ca_cert]) : GRPC::Core::ChannelCredentials.new
      call_creds = GRPC::Core::CallCredentials.new(proc { { "authorization" => "Bearer #{options[:api_key]}" } })
      creds = channel_creds.compose(call_creds)

      @stub = Gooseai::GenerationService::Stub.new(host, creds)
    end

    def generate(prompt, &block)
      image_param = image_param()
      req = Gooseai::Request.new(prompt: [Gooseai::Prompt.new(text: prompt)], engine_id: DEFAULT_ENGINE_ID, image: image_param)

      @stub.generate(req).each do |answer|
        block.call(answer)
      end
    end

    def image_param(options={})
      width = options[:width] || DEFAULT_IMAGE_WIDTH
      height = options[:height] || DEFAULT_IMAGE_HEIGHT
      sample = options[:sample] || DEFAULT_SAMPLE_SIZE
      steps = options[:steps] || DEFAULT_STEPS
      seed = [rand(10000)]
      transform = Gooseai::TransformType.new(diffusion: Gooseai::DiffusionSampler::SAMPLER_K_LMS)

      return Gooseai::ImageParameters.new(
        width: width,
        height: height,
        samples: sample,
        steps: steps,
        transform: transform,
        seed: seed,
      )
    end
  end
end
