# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: generation.proto

require 'google/protobuf'

Google::Protobuf::DescriptorPool.generated_pool.build do
  add_file("generation.proto", :syntax => :proto3) do
    add_message "gooseai.Token" do
      proto3_optional :text, :string, 1
      optional :id, :uint32, 2
    end
    add_message "gooseai.Tokens" do
      repeated :tokens, :message, 1, "gooseai.Token"
      proto3_optional :tokenizer_id, :string, 2
    end
    add_message "gooseai.Artifact" do
      optional :id, :uint64, 1
      optional :type, :enum, 2, "gooseai.ArtifactType"
      optional :mime, :string, 3
      proto3_optional :magic, :string, 4
      optional :index, :uint32, 8
      optional :finish_reason, :enum, 9, "gooseai.FinishReason"
      optional :seed, :uint32, 10
      oneof :data do
        optional :binary, :bytes, 5
        optional :text, :string, 6
        optional :tokens, :message, 7, "gooseai.Tokens"
        optional :classifier, :message, 11, "gooseai.ClassifierParameters"
      end
    end
    add_message "gooseai.PromptParameters" do
      proto3_optional :init, :bool, 1
      proto3_optional :weight, :float, 2
    end
    add_message "gooseai.Prompt" do
      proto3_optional :parameters, :message, 1, "gooseai.PromptParameters"
      oneof :prompt do
        optional :text, :string, 2
        optional :tokens, :message, 3, "gooseai.Tokens"
        optional :artifact, :message, 4, "gooseai.Artifact"
      end
    end
    add_message "gooseai.AnswerMeta" do
      proto3_optional :gpu_id, :string, 1
      proto3_optional :cpu_id, :string, 2
      proto3_optional :node_id, :string, 3
      proto3_optional :engine_id, :string, 4
    end
    add_message "gooseai.Answer" do
      optional :answer_id, :string, 1
      optional :request_id, :string, 2
      optional :received, :uint64, 3
      optional :created, :uint64, 4
      proto3_optional :meta, :message, 6, "gooseai.AnswerMeta"
      repeated :artifacts, :message, 7, "gooseai.Artifact"
    end
    add_message "gooseai.SamplerParameters" do
      proto3_optional :eta, :float, 1
      proto3_optional :sampling_steps, :uint64, 2
      proto3_optional :latent_channels, :uint64, 3
      proto3_optional :downsampling_factor, :uint64, 4
      proto3_optional :cfg_scale, :float, 5
    end
    add_message "gooseai.ConditionerParameters" do
      proto3_optional :vector_adjust_prior, :string, 1
    end
    add_message "gooseai.StepParameter" do
      optional :scaled_step, :float, 1
      proto3_optional :sampler, :message, 2, "gooseai.SamplerParameters"
    end
    add_message "gooseai.TransformType" do
      oneof :type do
        optional :diffusion, :enum, 1, "gooseai.DiffusionSampler"
        optional :upscaler, :enum, 2, "gooseai.Upscaler"
      end
    end
    add_message "gooseai.ImageParameters" do
      proto3_optional :height, :uint64, 1
      proto3_optional :width, :uint64, 2
      repeated :seed, :uint32, 3
      proto3_optional :samples, :uint64, 4
      proto3_optional :steps, :uint64, 5
      proto3_optional :transform, :message, 6, "gooseai.TransformType"
      repeated :parameters, :message, 7, "gooseai.StepParameter"
    end
    add_message "gooseai.ClassifierConcept" do
      optional :concept, :string, 1
      proto3_optional :threshold, :float, 2
    end
    add_message "gooseai.ClassifierCategory" do
      optional :name, :string, 1
      repeated :concepts, :message, 2, "gooseai.ClassifierConcept"
      proto3_optional :adjustment, :float, 3
      proto3_optional :action, :enum, 4, "gooseai.Action"
      proto3_optional :classifier_mode, :enum, 5, "gooseai.ClassifierMode"
    end
    add_message "gooseai.ClassifierParameters" do
      repeated :categories, :message, 1, "gooseai.ClassifierCategory"
      repeated :exceeds, :message, 2, "gooseai.ClassifierCategory"
      proto3_optional :realized_action, :enum, 3, "gooseai.Action"
    end
    add_message "gooseai.Request" do
      optional :engine_id, :string, 1
      optional :request_id, :string, 2
      optional :requested_type, :enum, 3, "gooseai.ArtifactType"
      repeated :prompt, :message, 4, "gooseai.Prompt"
      proto3_optional :conditioner, :message, 6, "gooseai.ConditionerParameters"
      proto3_optional :classifier, :message, 7, "gooseai.ClassifierParameters"
      oneof :params do
        optional :image, :message, 5, "gooseai.ImageParameters"
      end
    end
    add_enum "gooseai.FinishReason" do
      value :NULL, 0
      value :LENGTH, 1
      value :STOP, 2
      value :ERROR, 3
      value :FILTER, 4
    end
    add_enum "gooseai.ArtifactType" do
      value :ARTIFACT_NONE, 0
      value :ARTIFACT_IMAGE, 1
      value :ARTIFACT_VIDEO, 2
      value :ARTIFACT_TEXT, 3
      value :ARTIFACT_TOKENS, 4
      value :ARTIFACT_EMBEDDING, 5
      value :ARTIFACT_CLASSIFICATIONS, 6
    end
    add_enum "gooseai.DiffusionSampler" do
      value :SAMPLER_DDIM, 0
      value :SAMPLER_DDPM, 1
      value :SAMPLER_K_EULER, 2
      value :SAMPLER_K_EULER_ANCESTRAL, 3
      value :SAMPLER_K_HEUN, 4
      value :SAMPLER_K_DPM_2, 5
      value :SAMPLER_K_DPM_2_ANCESTRAL, 6
      value :SAMPLER_K_LMS, 7
    end
    add_enum "gooseai.Upscaler" do
      value :UPSCALER_RGB, 0
      value :UPSCALER_GFPGAN, 1
      value :UPSCALER_ESRGAN, 2
    end
    add_enum "gooseai.Action" do
      value :ACTION_PASSTHROUGH, 0
      value :ACTION_REGENERATE_DUPLICATE, 1
      value :ACTION_REGENERATE, 2
      value :ACTION_OBFUSCATE_DUPLICATE, 3
      value :ACTION_OBFUSCATE, 4
      value :ACTION_DISCARD, 5
    end
    add_enum "gooseai.ClassifierMode" do
      value :CLSFR_MODE_ZEROSHOT, 0
      value :CLSFR_MODE_MULTICLASS, 1
    end
  end
end

module Gooseai
  Token = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("gooseai.Token").msgclass
  Tokens = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("gooseai.Tokens").msgclass
  Artifact = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("gooseai.Artifact").msgclass
  PromptParameters = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("gooseai.PromptParameters").msgclass
  Prompt = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("gooseai.Prompt").msgclass
  AnswerMeta = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("gooseai.AnswerMeta").msgclass
  Answer = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("gooseai.Answer").msgclass
  SamplerParameters = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("gooseai.SamplerParameters").msgclass
  ConditionerParameters = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("gooseai.ConditionerParameters").msgclass
  StepParameter = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("gooseai.StepParameter").msgclass
  TransformType = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("gooseai.TransformType").msgclass
  ImageParameters = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("gooseai.ImageParameters").msgclass
  ClassifierConcept = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("gooseai.ClassifierConcept").msgclass
  ClassifierCategory = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("gooseai.ClassifierCategory").msgclass
  ClassifierParameters = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("gooseai.ClassifierParameters").msgclass
  Request = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("gooseai.Request").msgclass
  FinishReason = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("gooseai.FinishReason").enummodule
  ArtifactType = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("gooseai.ArtifactType").enummodule
  DiffusionSampler = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("gooseai.DiffusionSampler").enummodule
  Upscaler = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("gooseai.Upscaler").enummodule
  Action = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("gooseai.Action").enummodule
  ClassifierMode = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("gooseai.ClassifierMode").enummodule
end