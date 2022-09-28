require_relative 'lib/stability_sdk/version'

Gem::Specification.new do |spec|
  spec.name          = "stability_sdk"
  spec.version       = StabilitySDK::VERSION
  spec.authors       = ["Kosei Moriyama"]
  spec.email         = ["cou929@gmail.com"]

  spec.summary       = "Ruby client for interacting with stability.ai APIs (e.g. stable diffusion inference)"
  spec.description   = "Interacting with stability.ai APIs (e.g. stable diffusion inference). Ruby client of https://github.com/Stability-AI/stability-sdk ."
  spec.homepage      = "https://github.com/cou929/stability-sdk-ruby"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.3.0")
  spec.license       = "MIT"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/cou929/stability-sdk-ruby"
  spec.metadata["changelog_uri"] = "https://github.com/cou929/stability-sdk-ruby"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "grpc", ">= 1.0.0"
  spec.add_dependency "mime-types", ">= 3.0.0"
  spec.add_development_dependency "grpc-tools"
end
