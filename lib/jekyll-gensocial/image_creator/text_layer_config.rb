# frozen_string_literal: true

module Jekyll
  module Gensocial
    module ImageCreator
      class TextLayerConfig
        attr_reader :string, :font_path, :pointsize, :fill, :rect

        def initialize(hash)
          @string = hash["string"]
          @font_path = hash["font_path"]
          @pointsize = hash["pointsize"]
          @fill = hash["fill"]
          @rect = Geometry::Rect.new(hash["rect"])
        end
      end
    end
  end
end
