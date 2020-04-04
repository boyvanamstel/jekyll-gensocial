# frozen_string_literal: true

module Jekyll
  module Gensocial
    module Geometry
      Size = Struct.new(:width, :height, keyword_init: true)
      Point = Struct.new(:x, :y, keyword_init: true)

      class Rect
        attr_reader :size, :origin

        def initialize(hash)
          @size = Size.new(hash["size"])
          @origin = Point.new(hash["origin"])
        end
      end
    end
  end
end
