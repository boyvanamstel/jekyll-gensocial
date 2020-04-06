# frozen_string_literal: true

module Jekyll
  module Gensocial
    module ImageCreator
      class BackgroundLayerConfig
        attr_reader :path

        def initialize(hash, base_path:)
          @path = File.join(base_path, hash["path"]) unless hash["path"].nil?
        end
      end
    end
  end
end
