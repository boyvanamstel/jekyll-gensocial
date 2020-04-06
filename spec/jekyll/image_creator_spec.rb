# frozen_string_literal: true

module Jekyll
  module Gensocial
    module ImageCreator
      RSpec.describe ImageCreator do
        context "when configuring" do
          it "should create background layer config" do
            config = {
              "path" => "some/path.jpg",
            }
            bg_config = BackgroundLayerConfig.new(config, :base_path => "/a/base/path/")

            expect(bg_config.path).to eq("/a/base/path/some/path.jpg")
          end

          it "should create text layer config" do
            # rubocop:disable Layout/HashAlignment
            config = {
              "string" => "some text",
              "font_path" => "some/font.tff",
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
            }
            # rubocop:enable Layout/HashAlignment
            text_config = TextLayerConfig.new(config, :base_path => "/a/base/path/")

            expect(text_config.string).to eq("some text")
            expect(text_config.font_path).to eq("/a/base/path/some/font.tff")
            expect(text_config.pointsize).to eq(100)
            expect(text_config.fill).to eq("#000000")
            expect(text_config.rect.size.width).to eq(1600)
            expect(text_config.rect.size.height).to eq(500)
            expect(text_config.rect.origin.x).to eq(150)
            expect(text_config.rect.origin.y).to eq(100)
          end
        end

        context "when composing" do
          it "should have the correct dimensions" do
            size = Jekyll::Gensocial::Geometry::Size.new(:width => 1337, :height => 413)
            image = Composer.new(:image_size => size).image

            expect(image.columns).to eq(1337)
            expect(image.rows).to eq(413)
          end
        end
      end
    end
  end
end
