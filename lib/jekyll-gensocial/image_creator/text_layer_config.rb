# frozen_string_literal: true

module Jekyll
  module Gensocial
    module ImageCreator
      class TextLayerConfig
        attr_reader :string, :font_path, :pointsize, :fill, :rect

        def initialize(hash, base_path:)
          @string = hash["string"]
          @font_path = File.join(base_path, hash["font_path"]) unless hash["font_path"].nil?
          @pointsize = hash["pointsize"]
          @fill = hash["fill"]
          @rect = Geometry::Rect.new(hash["rect"])
        end
      end
    end
  end
end
