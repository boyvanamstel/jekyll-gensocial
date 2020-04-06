# frozen_string_literal: true

require "jekyll"
require "jekyll-gensocial/version"
require "jekyll-gensocial/generator"
require "jekyll-gensocial/geometry"
require "jekyll-gensocial/image_creator"

module Jekyll
  module Gensocial
    # rubocop:disable Layout/HashAlignment
    DEFAULTS = {
      "enabled" => true,
      "size" => {
        "width" => 1920,
        "height" => 1080,
      },
      "background" => {
        "path" => nil,
      },
      "text" => {
        "string" => nil,
        "font_path" => nil,
        "pointsize" => 100,
        "fill" => "#000000",
        "rect" => {
          "size" => {
            "width" => 1600,
            "height" => 500,
          },
          "origin" => {
            "x" => 150,
            "y" => 100,
          },
        },
      },
    }.freeze
    # rubocop:enable Layout/HashAlignment
  end
end
