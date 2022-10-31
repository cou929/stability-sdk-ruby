module StabilitySDK
  class CLI
    def self.save_answer(answer, options, logger)
      logger.debug "received answer: #{answer}"
      return if options[:no_store]

      answer.artifacts.each_with_index do |artifact, idx|
        filename_base = "#{options[:prefix] || "generation"}-#{answer.request_id}-#{answer.answer_id}-#{idx}"

        filename = ""
        contents = ""

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
