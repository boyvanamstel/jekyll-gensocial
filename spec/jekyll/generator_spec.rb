# frozen_string_literal: true

module Jekyll
  module Gensocial
    RSpec.describe Generator do
      let(:site)     { make_site }
      before(:each) do
        site.process
      end

      before(:all) do
        Jekyll.logger.log_level = :error
        FileUtils.mkdir_p source_dir("assets", "img")
      end

      after(:all) do
        FileUtils.remove_dir dest_dir
        FileUtils.remove_dir source_dir("assets")
      end

      it "should generate images" do
        ["post.jpg", "other-post.jpg", "no-title.jpg"].each do |file|
          expect(File.exist?(dest_dir("assets", "img", file))).to be_truthy
        end
      end

      it "should match the original images" do
        ["post.jpg", "other-post.jpg", "no-title.jpg"].each do |file|
          proof = Image.read(source_dir("proof", file)).first
          actual = Image.read(dest_dir("assets", "img", file)).first
          expect(actual).to eq(proof)
        end
      end
    end
  end
end
