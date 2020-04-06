# frozen_string_literal: true

module Jekyll
  module Gensocial
    RSpec.describe Generator do
      before(:all) do
        Jekyll.logger.log_level = :error
      end

      before(:each) do
        FileUtils.mkdir_p source_dir("assets", "img")
      end

      after(:each) do
        FileUtils.remove_dir dest_dir
        FileUtils.remove_dir source_dir("assets")
      end

      context "when enabled" do
        it "should have created images" do
          make_site({ "jekyll-gensocial" => { "enabled" => true } }).process

          ["post.jpg", "other-post.jpg", "no-title.jpg"].each do |file|
            expect(File.exist?(dest_dir("assets", "img", file))).to be_truthy
          end
        end
      end

      context "when disabled" do
        it "should not have created images" do
          make_site({ "jekyll-gensocial" => { "enabled" => false } }).process

          ["post.jpg", "other-post.jpg", "no-title.jpg"].each do |file|
            expect(File.exist?(dest_dir("assets", "img", file))).to be_falsy
          end
        end
      end
    end
  end
end
