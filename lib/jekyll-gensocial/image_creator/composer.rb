# frozen_string_literal: true

require 'rmagick'
include Magick

module Jekyll
  module Gensocial
    module ImageCreator
      class Composer
        attr_reader :image

        def initialize(image_size:)
          @image_size = image_size
          @image = Image.new(image_size.width, image_size.height)
        end

        def add_bg_layer(config:)
          return if config.path.nil?

          bg_layer = Image.read(config.path).first

          @image.composite!(bg_layer, CenterGravity, OverCompositeOp)
        end

        def add_text_layer(text, config:)
          origin = config.rect.origin
          size = config.rect.size

          text_layer = Magick::Image.read("caption:#{text}") {
            self.fill = config.fill
            self.font = config.font_path unless config.font_path.nil?
            self.pointsize = config.pointsize
            self.size = "#{size.width}x#{size.height}"
            self.background_color = "none"
          }.first

          @image.composite!(text_layer, NorthWestGravity, origin.x, origin.y, OverCompositeOp)
        end
      end
    end
  end
end
