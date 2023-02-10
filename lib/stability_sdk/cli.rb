module StabilitySDK
  class CLI
    def self.save_answer(answer, options, logger)
      logger.debug "received answer: #{answer}"
      return if options[:no_store]

      allowed_artifact_types = []
      if options.has_key?(:artifact_types)
        allowed_artifact_types = options[:artifact_types].map(&:to_sym)
      end

      answer.artifacts.each_with_index do |artifact, idx|
        filename_base = "#{options[:prefix] || "generation"}-#{answer.request_id}-#{answer.answer_id}-#{idx}"

        filename = ""
        contents = ""

        if allowed_artifact_types.size > 0 && !allowed_artifact_types.include?(artifact.type)
          logger.info "skipping #{artifact.type} due to artifact type filter"
          next
        end

        case artifact.type
        when :ARTIFACT_IMAGE
          ext = MIME::Types[artifact.mime].first.preferred_extension
          filename = "#{filename_base}.#{ext}"
          contents = artifact.binary
        when :ARTIFACT_CLASSIFICATIONS
          ext = "pb.json"
          filename = "#{filename_base}.#{ext}"
          contents = artifact.classifier.to_json
        else
          logger.warn "not implemented for ArtifactType #{artifact.type}"
        end

        if artifact.finish_reason == :FILTER
          logger.debug "the generated image is filtered"
        end

        next if filename == "" || contents == ""

        File.open(filename, "wb") do |f|
          f.write(contents)
          logger.debug "wrote #{artifact.type} to #{filename}"
        end
      end
    end
  end
end
