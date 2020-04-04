# frozen_string_literal: true

module Jekyll
  module Gensocial
    module Geometry
      RSpec.describe Geometry do
        it "should create size" do
          hash = { "width" => 1920, "height" => 1080 }
          size = Size.new(hash)

          valid_size = Size.new(width: 1920, height: 1080)

          expect(size).to eq(valid_size)
        end

        it "should create point" do
          hash = { "x" => 150, "y" => 100 }
          point = Point.new(hash)

          valid_point = Point.new(x: 150, y: 100)

          expect(point).to eq(valid_point)
        end

        it "should create rect" do
          hash = { "size" => { "width" => 1920, "height" => 1080 }, "origin" => { "x" => 150, "y" => 100 } }
          rect = Rect.new(hash)
          
          valid_size = Size.new(width: 1920, height: 1080)
          valid_origin = Point.new(x: 150, y: 100)

          expect(rect.size).to eq(valid_size)
          expect(rect.origin).to eq(valid_origin)
        end
      end
    end
  end
end
