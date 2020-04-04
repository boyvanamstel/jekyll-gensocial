# frozen_string_literal: true

module Jekyll
  module Gensocial
    RSpec.describe Generator do
      let(:site)      { make_site }

      before do
        Jekyll.logger.log_level = :error
      end

      after do
        FileUtils.remove_dir dest_dir if File.directory? dest_dir
      end

      it "should generate images" do
        #generator = Generator.new CONFIG_DEFAULTS
        #generator.generate site

        pending "this needs to be implemented"
      end
    end
  end
end
