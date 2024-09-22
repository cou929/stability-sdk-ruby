# frozen_string_literal: true
# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: generation.proto

require 'google/protobuf'

require 'google/protobuf/struct_pb'
require 'tensors_pb'


descriptor_data = "\n\x10generation.proto\x12\x07gooseai\x1a\x1cgoogle/protobuf/struct.proto\x1a\rtensors.proto\"/\n\x05Token\x12\x11\n\x04text\x18\x01 \x01(\tH\x00\x88\x01\x01\x12\n\n\x02id\x18\x02 \x01(\rB\x07\n\x05_text\"T\n\x06Tokens\x12\x1e\n\x06tokens\x18\x01 \x03(\x0b\x32\x0e.gooseai.Token\x12\x19\n\x0ctokenizer_id\x18\x02 \x01(\tH\x00\x88\x01\x01\x42\x0f\n\r_tokenizer_id\"\xf3\x02\n\x08\x41rtifact\x12\n\n\x02id\x18\x01 \x01(\x04\x12#\n\x04type\x18\x02 \x01(\x0e\x32\x15.gooseai.ArtifactType\x12\x0c\n\x04mime\x18\x03 \x01(\t\x12\x12\n\x05magic\x18\x04 \x01(\tH\x01\x88\x01\x01\x12\x10\n\x06\x62inary\x18\x05 \x01(\x0cH\x00\x12\x0e\n\x04text\x18\x06 \x01(\tH\x00\x12!\n\x06tokens\x18\x07 \x01(\x0b\x32\x0f.gooseai.TokensH\x00\x12\x33\n\nclassifier\x18\x0b \x01(\x0b\x32\x1d.gooseai.ClassifierParametersH\x00\x12!\n\x06tensor\x18\x0e \x01(\x0b\x32\x0f.tensors.TensorH\x00\x12\r\n\x05index\x18\x08 \x01(\r\x12,\n\rfinish_reason\x18\t \x01(\x0e\x32\x15.gooseai.FinishReason\x12\x0c\n\x04seed\x18\n \x01(\r\x12\x0c\n\x04uuid\x18\x0c \x01(\t\x12\x0c\n\x04size\x18\r \x01(\x04\x42\x06\n\x04\x64\x61taB\x08\n\x06_magic\"N\n\x10PromptParameters\x12\x11\n\x04init\x18\x01 \x01(\x08H\x00\x88\x01\x01\x12\x13\n\x06weight\x18\x02 \x01(\x02H\x01\x88\x01\x01\x42\x07\n\x05_initB\t\n\x07_weight\"\xaf\x01\n\x06Prompt\x12\x32\n\nparameters\x18\x01 \x01(\x0b\x32\x19.gooseai.PromptParametersH\x01\x88\x01\x01\x12\x0e\n\x04text\x18\x02 \x01(\tH\x00\x12!\n\x06tokens\x18\x03 \x01(\x0b\x32\x0f.gooseai.TokensH\x00\x12%\n\x08\x61rtifact\x18\x04 \x01(\x0b\x32\x11.gooseai.ArtifactH\x00\x42\x08\n\x06promptB\r\n\x0b_parameters\"\xd7\x02\n\x11SamplerParameters\x12\x10\n\x03\x65ta\x18\x01 \x01(\x02H\x00\x88\x01\x01\x12\x1b\n\x0esampling_steps\x18\x02 \x01(\x04H\x01\x88\x01\x01\x12\x1c\n\x0flatent_channels\x18\x03 \x01(\x04H\x02\x88\x01\x01\x12 \n\x13\x64ownsampling_factor\x18\x04 \x01(\x04H\x03\x88\x01\x01\x12\x16\n\tcfg_scale\x18\x05 \x01(\x02H\x04\x88\x01\x01\x12\x1d\n\x10init_noise_scale\x18\x06 \x01(\x02H\x05\x88\x01\x01\x12\x1d\n\x10step_noise_scale\x18\x07 \x01(\x02H\x06\x88\x01\x01\x42\x06\n\x04_etaB\x11\n\x0f_sampling_stepsB\x12\n\x10_latent_channelsB\x16\n\x14_downsampling_factorB\x0c\n\n_cfg_scaleB\x13\n\x11_init_noise_scaleB\x13\n\x11_step_noise_scale\"\x8b\x01\n\x15\x43onditionerParameters\x12 \n\x13vector_adjust_prior\x18\x01 \x01(\tH\x00\x88\x01\x01\x12(\n\x0b\x63onditioner\x18\x02 \x01(\x0b\x32\x0e.gooseai.ModelH\x01\x88\x01\x01\x42\x16\n\x14_vector_adjust_priorB\x0e\n\x0c_conditioner\"j\n\x12ScheduleParameters\x12\x12\n\x05start\x18\x01 \x01(\x02H\x00\x88\x01\x01\x12\x10\n\x03\x65nd\x18\x02 \x01(\x02H\x01\x88\x01\x01\x12\x12\n\x05value\x18\x03 \x01(\x02H\x02\x88\x01\x01\x42\x08\n\x06_startB\x06\n\x04_endB\x08\n\x06_value\"\xe4\x01\n\rStepParameter\x12\x13\n\x0bscaled_step\x18\x01 \x01(\x02\x12\x30\n\x07sampler\x18\x02 \x01(\x0b\x32\x1a.gooseai.SamplerParametersH\x00\x88\x01\x01\x12\x32\n\x08schedule\x18\x03 \x01(\x0b\x32\x1b.gooseai.ScheduleParametersH\x01\x88\x01\x01\x12\x32\n\x08guidance\x18\x04 \x01(\x0b\x32\x1b.gooseai.GuidanceParametersH\x02\x88\x01\x01\x42\n\n\x08_samplerB\x0b\n\t_scheduleB\x0b\n\t_guidance\"\x97\x01\n\x05Model\x12\x30\n\x0c\x61rchitecture\x18\x01 \x01(\x0e\x32\x1a.gooseai.ModelArchitecture\x12\x11\n\tpublisher\x18\x02 \x01(\t\x12\x0f\n\x07\x64\x61taset\x18\x03 \x01(\t\x12\x0f\n\x07version\x18\x04 \x01(\x02\x12\x18\n\x10semantic_version\x18\x05 \x01(\t\x12\r\n\x05\x61lias\x18\x06 \x01(\t\"\xbc\x01\n\x10\x43utoutParameters\x12*\n\x07\x63utouts\x18\x01 \x03(\x0b\x32\x19.gooseai.CutoutParameters\x12\x12\n\x05\x63ount\x18\x02 \x01(\rH\x00\x88\x01\x01\x12\x11\n\x04gray\x18\x03 \x01(\x02H\x01\x88\x01\x01\x12\x11\n\x04\x62lur\x18\x04 \x01(\x02H\x02\x88\x01\x01\x12\x17\n\nsize_power\x18\x05 \x01(\x02H\x03\x88\x01\x01\x42\x08\n\x06_countB\x07\n\x05_grayB\x07\n\x05_blurB\r\n\x0b_size_power\"=\n\x1aGuidanceScheduleParameters\x12\x10\n\x08\x64uration\x18\x01 \x01(\x02\x12\r\n\x05value\x18\x02 \x01(\x02\"\x97\x02\n\x1aGuidanceInstanceParameters\x12\x1e\n\x06models\x18\x02 \x03(\x0b\x32\x0e.gooseai.Model\x12\x1e\n\x11guidance_strength\x18\x03 \x01(\x02H\x00\x88\x01\x01\x12\x35\n\x08schedule\x18\x04 \x03(\x0b\x32#.gooseai.GuidanceScheduleParameters\x12/\n\x07\x63utouts\x18\x05 \x01(\x0b\x32\x19.gooseai.CutoutParametersH\x01\x88\x01\x01\x12$\n\x06prompt\x18\x06 \x01(\x0b\x32\x0f.gooseai.PromptH\x02\x88\x01\x01\x42\x14\n\x12_guidance_strengthB\n\n\x08_cutoutsB\t\n\x07_prompt\"~\n\x12GuidanceParameters\x12\x30\n\x0fguidance_preset\x18\x01 \x01(\x0e\x32\x17.gooseai.GuidancePreset\x12\x36\n\tinstances\x18\x02 \x03(\x0b\x32#.gooseai.GuidanceInstanceParameters\"n\n\rTransformType\x12.\n\tdiffusion\x18\x01 \x01(\x0e\x32\x19.gooseai.DiffusionSamplerH\x00\x12%\n\x08upscaler\x18\x02 \x01(\x0e\x32\x11.gooseai.UpscalerH\x00\x42\x06\n\x04type\"\x8e\x01\n\x13T2IAdapterParameter\x12)\n\x0c\x61\x64\x61pter_type\x18\x01 \x01(\x0e\x32\x13.gooseai.T2IAdapter\x12\x18\n\x10\x61\x64\x61pter_strength\x18\x02 \x01(\x02\x12\x32\n\x11\x61\x64\x61pter_init_type\x18\x03 \x01(\x0e\x32\x17.gooseai.T2IAdapterInit\"\xd4\x01\n\x1c\x43ontentCredentialsParameters\x12M\n\x0emodel_metadata\x18\x01 \x01(\x0e\x32\x33.gooseai.ContentCredentialsParameters.ModelMetadataH\x00\"W\n\rModelMetadata\x12\x1e\n\x1aMODEL_METADATA_UNSPECIFIED\x10\x00\x12&\n\"MODEL_METADATA_SIGN_WITH_ENGINE_ID\x10\x01\x42\x0c\n\nparameters\"H\n\x14\x46ineTuningParameters\x12\x10\n\x08model_id\x18\x01 \x01(\t\x12\x13\n\x06weight\x18\x02 \x01(\x02H\x00\x88\x01\x01\x42\t\n\x07_weight\"\xb9\x05\n\x0fImageParameters\x12\x13\n\x06height\x18\x01 \x01(\x04H\x00\x88\x01\x01\x12\x12\n\x05width\x18\x02 \x01(\x04H\x01\x88\x01\x01\x12\x0c\n\x04seed\x18\x03 \x03(\r\x12\x14\n\x07samples\x18\x04 \x01(\x04H\x02\x88\x01\x01\x12\x12\n\x05steps\x18\x05 \x01(\x04H\x03\x88\x01\x01\x12.\n\ttransform\x18\x06 \x01(\x0b\x32\x16.gooseai.TransformTypeH\x04\x88\x01\x01\x12*\n\nparameters\x18\x07 \x03(\x0b\x32\x16.gooseai.StepParameter\x12\x36\n\x10masked_area_init\x18\x08 \x01(\x0e\x32\x17.gooseai.MaskedAreaInitH\x05\x88\x01\x01\x12\x31\n\rweight_method\x18\t \x01(\x0e\x32\x15.gooseai.WeightMethodH\x06\x88\x01\x01\x12\x15\n\x08quantize\x18\n \x01(\x08H\x07\x88\x01\x01\x12\x32\n\x07\x61\x64\x61pter\x18\x0c \x01(\x0b\x32\x1c.gooseai.T2IAdapterParameterH\x08\x88\x01\x01\x12=\n\x16\x66ine_tuning_parameters\x18\r \x03(\x0b\x32\x1d.gooseai.FineTuningParameters\x12R\n\x1e\x63ontent_credentials_parameters\x18\x0e \x01(\x0b\x32%.gooseai.ContentCredentialsParametersH\t\x88\x01\x01\x42\t\n\x07_heightB\x08\n\x06_widthB\n\n\x08_samplesB\x08\n\x06_stepsB\x0c\n\n_transformB\x13\n\x11_masked_area_initB\x10\n\x0e_weight_methodB\x0b\n\t_quantizeB\n\n\x08_adapterB!\n\x1f_content_credentials_parametersJ\x04\x08\x0b\x10\x0c\"J\n\x11\x43lassifierConcept\x12\x0f\n\x07\x63oncept\x18\x01 \x01(\t\x12\x16\n\tthreshold\x18\x02 \x01(\x02H\x00\x88\x01\x01\x42\x0c\n\n_threshold\"\xf4\x01\n\x12\x43lassifierCategory\x12\x0c\n\x04name\x18\x01 \x01(\t\x12,\n\x08\x63oncepts\x18\x02 \x03(\x0b\x32\x1a.gooseai.ClassifierConcept\x12\x17\n\nadjustment\x18\x03 \x01(\x02H\x00\x88\x01\x01\x12$\n\x06\x61\x63tion\x18\x04 \x01(\x0e\x32\x0f.gooseai.ActionH\x01\x88\x01\x01\x12\x35\n\x0f\x63lassifier_mode\x18\x05 \x01(\x0e\x32\x17.gooseai.ClassifierModeH\x02\x88\x01\x01\x42\r\n\x0b_adjustmentB\t\n\x07_actionB\x12\n\x10_classifier_mode\"\xb8\x01\n\x14\x43lassifierParameters\x12/\n\ncategories\x18\x01 \x03(\x0b\x32\x1b.gooseai.ClassifierCategory\x12,\n\x07\x65xceeds\x18\x02 \x03(\x0b\x32\x1b.gooseai.ClassifierCategory\x12-\n\x0frealized_action\x18\x03 \x01(\x0e\x32\x0f.gooseai.ActionH\x00\x88\x01\x01\x42\x12\n\x10_realized_action\"]\n\x15InterpolateParameters\x12\x0e\n\x06ratios\x18\x01 \x03(\x02\x12+\n\x04mode\x18\x02 \x01(\x0e\x32\x18.gooseai.InterpolateModeH\x00\x88\x01\x01\x42\x07\n\x05_mode\"\x9c\x03\n\x14TransformColorAdjust\x12\x17\n\nbrightness\x18\x01 \x01(\x02H\x00\x88\x01\x01\x12\x15\n\x08\x63ontrast\x18\x02 \x01(\x02H\x01\x88\x01\x01\x12\x10\n\x03hue\x18\x03 \x01(\x02H\x02\x88\x01\x01\x12\x17\n\nsaturation\x18\x04 \x01(\x02H\x03\x88\x01\x01\x12\x16\n\tlightness\x18\x05 \x01(\x02H\x04\x88\x01\x01\x12+\n\x0bmatch_image\x18\x06 \x01(\x0b\x32\x11.gooseai.ArtifactH\x05\x88\x01\x01\x12\x30\n\nmatch_mode\x18\x07 \x01(\x0e\x32\x17.gooseai.ColorMatchModeH\x06\x88\x01\x01\x12\x19\n\x0cnoise_amount\x18\x08 \x01(\x02H\x07\x88\x01\x01\x12\x17\n\nnoise_seed\x18\t \x01(\rH\x08\x88\x01\x01\x42\r\n\x0b_brightnessB\x0b\n\t_contrastB\x06\n\x04_hueB\r\n\x0b_saturationB\x0c\n\n_lightnessB\x0e\n\x0c_match_imageB\r\n\x0b_match_modeB\x0f\n\r_noise_amountB\r\n\x0b_noise_seed\"\x8c\x01\n\x12TransformDepthCalc\x12\x19\n\x0c\x62lend_weight\x18\x01 \x01(\x02H\x00\x88\x01\x01\x12\x18\n\x0b\x62lur_radius\x18\x02 \x01(\rH\x01\x88\x01\x01\x12\x14\n\x07reverse\x18\x03 \x01(\x08H\x02\x88\x01\x01\x42\x0f\n\r_blend_weightB\x0e\n\x0c_blur_radiusB\n\n\x08_reverse\"#\n\x0fTransformMatrix\x12\x10\n\x04\x64\x61ta\x18\x01 \x03(\x02\x42\x02\x10\x01\"\x86\x02\n\x11TransformResample\x12(\n\x0b\x62order_mode\x18\x01 \x01(\x0e\x32\x13.gooseai.BorderMode\x12+\n\ttransform\x18\x02 \x01(\x0b\x32\x18.gooseai.TransformMatrix\x12\x35\n\x0eprev_transform\x18\x03 \x01(\x0b\x32\x18.gooseai.TransformMatrixH\x00\x88\x01\x01\x12\x17\n\ndepth_warp\x18\x04 \x01(\x02H\x01\x88\x01\x01\x12\x18\n\x0b\x65xport_mask\x18\x05 \x01(\x08H\x02\x88\x01\x01\x42\x11\n\x0f_prev_transformB\r\n\x0b_depth_warpB\x0e\n\x0c_export_mask\"}\n\x10\x43\x61meraParameters\x12(\n\x0b\x63\x61mera_type\x18\x01 \x01(\x0e\x32\x13.gooseai.CameraType\x12\x12\n\nnear_plane\x18\x02 \x01(\x02\x12\x11\n\tfar_plane\x18\x03 \x01(\x02\x12\x10\n\x03\x66ov\x18\x04 \x01(\x02H\x00\x88\x01\x01\x42\x06\n\x04_fov\"\xd9\x01\n\x13TransformCameraPose\x12\x36\n\x14world_to_view_matrix\x18\x01 \x01(\x0b\x32\x18.gooseai.TransformMatrix\x12\x34\n\x11\x63\x61mera_parameters\x18\x02 \x01(\x0b\x32\x19.gooseai.CameraParameters\x12\x12\n\ndo_prefill\x18\x05 \x01(\x08\x12(\n\x0brender_mode\x18\x08 \x01(\x0e\x32\x13.gooseai.RenderModeJ\x04\x08\x03\x10\x04J\x04\x08\x04\x10\x05J\x04\x08\x06\x10\x07J\x04\x08\x07\x10\x08\"\xf1\x01\n\x13TransformParameters\x12\x35\n\x0c\x63olor_adjust\x18\x02 \x01(\x0b\x32\x1d.gooseai.TransformColorAdjustH\x00\x12\x31\n\ndepth_calc\x18\x04 \x01(\x0b\x32\x1b.gooseai.TransformDepthCalcH\x00\x12.\n\x08resample\x18\x05 \x01(\x0b\x32\x1a.gooseai.TransformResampleH\x00\x12\x33\n\x0b\x63\x61mera_pose\x18\x06 \x01(\x0b\x32\x1c.gooseai.TransformCameraPoseH\x00\x42\x0b\n\ttransform\"k\n\x0f\x41ssetParameters\x12$\n\x06\x61\x63tion\x18\x01 \x01(\x0e\x32\x14.gooseai.AssetAction\x12\x12\n\nproject_id\x18\x02 \x01(\t\x12\x1e\n\x03use\x18\x03 \x01(\x0e\x32\x11.gooseai.AssetUse\"\x94\x01\n\nAnswerMeta\x12\x13\n\x06gpu_id\x18\x01 \x01(\tH\x00\x88\x01\x01\x12\x13\n\x06\x63pu_id\x18\x02 \x01(\tH\x01\x88\x01\x01\x12\x14\n\x07node_id\x18\x03 \x01(\tH\x02\x88\x01\x01\x12\x16\n\tengine_id\x18\x04 \x01(\tH\x03\x88\x01\x01\x42\t\n\x07_gpu_idB\t\n\x07_cpu_idB\n\n\x08_node_idB\x0c\n\n_engine_id\"\xa9\x01\n\x06\x41nswer\x12\x11\n\tanswer_id\x18\x01 \x01(\t\x12\x12\n\nrequest_id\x18\x02 \x01(\t\x12\x10\n\x08received\x18\x03 \x01(\x04\x12\x0f\n\x07\x63reated\x18\x04 \x01(\x04\x12&\n\x04meta\x18\x06 \x01(\x0b\x32\x13.gooseai.AnswerMetaH\x00\x88\x01\x01\x12$\n\tartifacts\x18\x07 \x03(\x0b\x32\x11.gooseai.ArtifactB\x07\n\x05_meta\"A\n\x0b\x41nswerBatch\x12\x10\n\x08\x62\x61tch_id\x18\x01 \x01(\t\x12 \n\x07\x61nswers\x18\x02 \x03(\x0b\x32\x0f.gooseai.Answer\"\x8f\x04\n\x07Request\x12\x11\n\tengine_id\x18\x01 \x01(\t\x12\x12\n\nrequest_id\x18\x02 \x01(\t\x12-\n\x0erequested_type\x18\x03 \x01(\x0e\x32\x15.gooseai.ArtifactType\x12\x1f\n\x06prompt\x18\x04 \x03(\x0b\x32\x0f.gooseai.Prompt\x12)\n\x05image\x18\x05 \x01(\x0b\x32\x18.gooseai.ImageParametersH\x00\x12\x33\n\nclassifier\x18\x07 \x01(\x0b\x32\x1d.gooseai.ClassifierParametersH\x00\x12)\n\x05\x61sset\x18\x08 \x01(\x0b\x32\x18.gooseai.AssetParametersH\x00\x12\x35\n\x0binterpolate\x18\x0b \x01(\x0b\x32\x1e.gooseai.InterpolateParametersH\x00\x12\x31\n\ttransform\x18\x0c \x01(\x0b\x32\x1c.gooseai.TransformParametersH\x00\x12\x38\n\x0b\x63onditioner\x18\x06 \x01(\x0b\x32\x1e.gooseai.ConditionerParametersH\x01\x88\x01\x01\x12-\n\x06\x65xtras\x18\xff\x0f \x01(\x0b\x32\x17.google.protobuf.StructH\x02\x88\x01\x01\x42\x08\n\x06paramsB\x0e\n\x0c_conditionerB\t\n\x07_extrasJ\x04\x08\t\x10\nJ\x04\x08\n\x10\x0b\"\xc2\x01\n\x08OnStatus\x12%\n\x06reason\x18\x01 \x03(\x0e\x32\x15.gooseai.FinishReason\x12\x13\n\x06target\x18\x02 \x01(\tH\x00\x88\x01\x01\x12$\n\x06\x61\x63tion\x18\x03 \x03(\x0e\x32\x14.gooseai.StageAction\x12\x37\n\rartifact_type\x18\x04 \x01(\x0b\x32\x1b.gooseai.ArtifactTypeFilterH\x01\x88\x01\x01\x42\t\n\x07_targetB\x10\n\x0e_artifact_type\"d\n\x12\x41rtifactTypeFilter\x12&\n\x07include\x18\x01 \x03(\x0e\x32\x15.gooseai.ArtifactType\x12&\n\x07\x65xclude\x18\x02 \x03(\x0e\x32\x15.gooseai.ArtifactType\"\\\n\x05Stage\x12\n\n\x02id\x18\x01 \x01(\t\x12!\n\x07request\x18\x02 \x01(\x0b\x32\x10.gooseai.Request\x12$\n\ton_status\x18\x03 \x03(\x0b\x32\x11.gooseai.OnStatus\"A\n\x0c\x43hainRequest\x12\x12\n\nrequest_id\x18\x01 \x01(\t\x12\x1d\n\x05stage\x18\x02 \x03(\x0b\x32\x0e.gooseai.Stage*E\n\x0c\x46inishReason\x12\x08\n\x04NULL\x10\x00\x12\n\n\x06LENGTH\x10\x01\x12\x08\n\x04STOP\x10\x02\x12\t\n\x05\x45RROR\x10\x03\x12\n\n\x06\x46ILTER\x10\x04*\x8f\x02\n\x0c\x41rtifactType\x12\x11\n\rARTIFACT_NONE\x10\x00\x12\x12\n\x0e\x41RTIFACT_IMAGE\x10\x01\x12\x12\n\x0e\x41RTIFACT_VIDEO\x10\x02\x12\x11\n\rARTIFACT_TEXT\x10\x03\x12\x13\n\x0f\x41RTIFACT_TOKENS\x10\x04\x12\x16\n\x12\x41RTIFACT_EMBEDDING\x10\x05\x12\x1c\n\x18\x41RTIFACT_CLASSIFICATIONS\x10\x06\x12\x11\n\rARTIFACT_MASK\x10\x07\x12\x13\n\x0f\x41RTIFACT_LATENT\x10\x08\x12\x13\n\x0f\x41RTIFACT_TENSOR\x10\t\x12\x12\n\x0e\x41RTIFACT_DEPTH\x10\n\x12\x15\n\x11\x41RTIFACT_3D_MODEL\x10\x0b*g\n\x0eMaskedAreaInit\x12\x19\n\x15MASKED_AREA_INIT_ZERO\x10\x00\x12\x1b\n\x17MASKED_AREA_INIT_RANDOM\x10\x01\x12\x1d\n\x19MASKED_AREA_INIT_ORIGINAL\x10\x02*5\n\x0cWeightMethod\x12\x10\n\x0cTEXT_ENCODER\x10\x00\x12\x13\n\x0f\x43ROSS_ATTENTION\x10\x01*\x98\x02\n\x10\x44iffusionSampler\x12\x10\n\x0cSAMPLER_DDIM\x10\x00\x12\x10\n\x0cSAMPLER_DDPM\x10\x01\x12\x13\n\x0fSAMPLER_K_EULER\x10\x02\x12\x1d\n\x19SAMPLER_K_EULER_ANCESTRAL\x10\x03\x12\x12\n\x0eSAMPLER_K_HEUN\x10\x04\x12\x13\n\x0fSAMPLER_K_DPM_2\x10\x05\x12\x1d\n\x19SAMPLER_K_DPM_2_ANCESTRAL\x10\x06\x12\x11\n\rSAMPLER_K_LMS\x10\x07\x12 \n\x1cSAMPLER_K_DPMPP_2S_ANCESTRAL\x10\x08\x12\x16\n\x12SAMPLER_K_DPMPP_2M\x10\t\x12\x17\n\x13SAMPLER_K_DPMPP_SDE\x10\n*F\n\x08Upscaler\x12\x10\n\x0cUPSCALER_RGB\x10\x00\x12\x13\n\x0fUPSCALER_GFPGAN\x10\x01\x12\x13\n\x0fUPSCALER_ESRGAN\x10\x02*\xd8\x01\n\x0eGuidancePreset\x12\x18\n\x14GUIDANCE_PRESET_NONE\x10\x00\x12\x1a\n\x16GUIDANCE_PRESET_SIMPLE\x10\x01\x12\x1d\n\x19GUIDANCE_PRESET_FAST_BLUE\x10\x02\x12\x1e\n\x1aGUIDANCE_PRESET_FAST_GREEN\x10\x03\x12\x18\n\x14GUIDANCE_PRESET_SLOW\x10\x04\x12\x1a\n\x16GUIDANCE_PRESET_SLOWER\x10\x05\x12\x1b\n\x17GUIDANCE_PRESET_SLOWEST\x10\x06*\x91\x01\n\x11ModelArchitecture\x12\x1b\n\x17MODEL_ARCHITECTURE_NONE\x10\x00\x12\x1f\n\x1bMODEL_ARCHITECTURE_CLIP_VIT\x10\x01\x12\"\n\x1eMODEL_ARCHITECTURE_CLIP_RESNET\x10\x02\x12\x1a\n\x16MODEL_ARCHITECTURE_LDM\x10\x03*d\n\nT2IAdapter\x12\x13\n\x0fT2IADAPTER_NONE\x10\x00\x12\x15\n\x11T2IADAPTER_SKETCH\x10\x01\x12\x14\n\x10T2IADAPTER_DEPTH\x10\x02\x12\x14\n\x10T2IADAPTER_CANNY\x10\x03*L\n\x0eT2IAdapterInit\x12\x18\n\x14T2IADAPTERINIT_IMAGE\x10\x00\x12 \n\x1cT2IADAPTERINIT_ADAPTER_IMAGE\x10\x01*\xa2\x01\n\x06\x41\x63tion\x12\x16\n\x12\x41\x43TION_PASSTHROUGH\x10\x00\x12\x1f\n\x1b\x41\x43TION_REGENERATE_DUPLICATE\x10\x01\x12\x15\n\x11\x41\x43TION_REGENERATE\x10\x02\x12\x1e\n\x1a\x41\x43TION_OBFUSCATE_DUPLICATE\x10\x03\x12\x14\n\x10\x41\x43TION_OBFUSCATE\x10\x04\x12\x12\n\x0e\x41\x43TION_DISCARD\x10\x05*D\n\x0e\x43lassifierMode\x12\x17\n\x13\x43LSFR_MODE_ZEROSHOT\x10\x00\x12\x19\n\x15\x43LSFR_MODE_MULTICLASS\x10\x01*\x8c\x01\n\x0fInterpolateMode\x12\x16\n\x12INTERPOLATE_LINEAR\x10\x00\x12\x14\n\x10INTERPOLATE_RIFE\x10\x01\x12\x1a\n\x16INTERPOLATE_VAE_LINEAR\x10\x02\x12\x19\n\x15INTERPOLATE_VAE_SLERP\x10\x03\x12\x14\n\x10INTERPOLATE_FILM\x10\x04*l\n\nBorderMode\x12\x12\n\x0e\x42ORDER_REFLECT\x10\x00\x12\x14\n\x10\x42ORDER_REPLICATE\x10\x01\x12\x0f\n\x0b\x42ORDER_WRAP\x10\x02\x12\x0f\n\x0b\x42ORDER_ZERO\x10\x03\x12\x12\n\x0e\x42ORDER_PREFILL\x10\x04*O\n\x0e\x43olorMatchMode\x12\x13\n\x0f\x43OLOR_MATCH_HSV\x10\x00\x12\x13\n\x0f\x43OLOR_MATCH_LAB\x10\x01\x12\x13\n\x0f\x43OLOR_MATCH_RGB\x10\x02*=\n\nCameraType\x12\x16\n\x12\x43\x41MERA_PERSPECTIVE\x10\x00\x12\x17\n\x13\x43\x41MERA_ORTHOGRAPHIC\x10\x01*4\n\nRenderMode\x12\x0f\n\x0bRENDER_MESH\x10\x00\x12\x15\n\x11RENDER_POINTCLOUD\x10\x01*=\n\x0b\x41ssetAction\x12\r\n\tASSET_PUT\x10\x00\x12\r\n\tASSET_GET\x10\x01\x12\x10\n\x0c\x41SSET_DELETE\x10\x02*\x81\x01\n\x08\x41ssetUse\x12\x17\n\x13\x41SSET_USE_UNDEFINED\x10\x00\x12\x13\n\x0f\x41SSET_USE_INPUT\x10\x01\x12\x14\n\x10\x41SSET_USE_OUTPUT\x10\x02\x12\x1a\n\x16\x41SSET_USE_INTERMEDIATE\x10\x03\x12\x15\n\x11\x41SSET_USE_PROJECT\x10\x04*W\n\x0bStageAction\x12\x15\n\x11STAGE_ACTION_PASS\x10\x00\x12\x18\n\x14STAGE_ACTION_DISCARD\x10\x01\x12\x17\n\x13STAGE_ACTION_RETURN\x10\x02\x32\x83\x01\n\x11GenerationService\x12\x31\n\x08Generate\x12\x10.gooseai.Request\x1a\x0f.gooseai.Answer\"\x00\x30\x01\x12;\n\rChainGenerate\x12\x15.gooseai.ChainRequest\x1a\x0f.gooseai.Answer\"\x00\x30\x01\x42;Z9github.com/stability-ai/api-interfaces/gooseai/generationb\x06proto3"

pool = Google::Protobuf::DescriptorPool.generated_pool
pool.add_serialized_file(descriptor_data)

module Gooseai
  Token = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("gooseai.Token").msgclass
  Tokens = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("gooseai.Tokens").msgclass
  Artifact = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("gooseai.Artifact").msgclass
  PromptParameters = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("gooseai.PromptParameters").msgclass
  Prompt = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("gooseai.Prompt").msgclass
  SamplerParameters = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("gooseai.SamplerParameters").msgclass
  ConditionerParameters = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("gooseai.ConditionerParameters").msgclass
  ScheduleParameters = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("gooseai.ScheduleParameters").msgclass
  StepParameter = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("gooseai.StepParameter").msgclass
  Model = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("gooseai.Model").msgclass
  CutoutParameters = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("gooseai.CutoutParameters").msgclass
  GuidanceScheduleParameters = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("gooseai.GuidanceScheduleParameters").msgclass
  GuidanceInstanceParameters = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("gooseai.GuidanceInstanceParameters").msgclass
  GuidanceParameters = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("gooseai.GuidanceParameters").msgclass
  TransformType = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("gooseai.TransformType").msgclass
  T2IAdapterParameter = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("gooseai.T2IAdapterParameter").msgclass
  ContentCredentialsParameters = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("gooseai.ContentCredentialsParameters").msgclass
  ContentCredentialsParameters::ModelMetadata = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("gooseai.ContentCredentialsParameters.ModelMetadata").enummodule
  FineTuningParameters = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("gooseai.FineTuningParameters").msgclass
  ImageParameters = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("gooseai.ImageParameters").msgclass
  ClassifierConcept = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("gooseai.ClassifierConcept").msgclass
  ClassifierCategory = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("gooseai.ClassifierCategory").msgclass
  ClassifierParameters = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("gooseai.ClassifierParameters").msgclass
  InterpolateParameters = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("gooseai.InterpolateParameters").msgclass
  TransformColorAdjust = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("gooseai.TransformColorAdjust").msgclass
  TransformDepthCalc = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("gooseai.TransformDepthCalc").msgclass
  TransformMatrix = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("gooseai.TransformMatrix").msgclass
  TransformResample = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("gooseai.TransformResample").msgclass
  CameraParameters = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("gooseai.CameraParameters").msgclass
  TransformCameraPose = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("gooseai.TransformCameraPose").msgclass
  TransformParameters = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("gooseai.TransformParameters").msgclass
  AssetParameters = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("gooseai.AssetParameters").msgclass
  AnswerMeta = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("gooseai.AnswerMeta").msgclass
  Answer = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("gooseai.Answer").msgclass
  AnswerBatch = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("gooseai.AnswerBatch").msgclass
  Request = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("gooseai.Request").msgclass
  OnStatus = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("gooseai.OnStatus").msgclass
  ArtifactTypeFilter = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("gooseai.ArtifactTypeFilter").msgclass
  Stage = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("gooseai.Stage").msgclass
  ChainRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("gooseai.ChainRequest").msgclass
  FinishReason = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("gooseai.FinishReason").enummodule
  ArtifactType = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("gooseai.ArtifactType").enummodule
  MaskedAreaInit = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("gooseai.MaskedAreaInit").enummodule
  WeightMethod = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("gooseai.WeightMethod").enummodule
  DiffusionSampler = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("gooseai.DiffusionSampler").enummodule
  Upscaler = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("gooseai.Upscaler").enummodule
  GuidancePreset = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("gooseai.GuidancePreset").enummodule
  ModelArchitecture = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("gooseai.ModelArchitecture").enummodule
  T2IAdapter = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("gooseai.T2IAdapter").enummodule
  T2IAdapterInit = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("gooseai.T2IAdapterInit").enummodule
  Action = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("gooseai.Action").enummodule
  ClassifierMode = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("gooseai.ClassifierMode").enummodule
  InterpolateMode = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("gooseai.InterpolateMode").enummodule
  BorderMode = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("gooseai.BorderMode").enummodule
  ColorMatchMode = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("gooseai.ColorMatchMode").enummodule
  CameraType = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("gooseai.CameraType").enummodule
  RenderMode = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("gooseai.RenderMode").enummodule
  AssetAction = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("gooseai.AssetAction").enummodule
  AssetUse = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("gooseai.AssetUse").enummodule
  StageAction = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("gooseai.StageAction").enummodule
end
