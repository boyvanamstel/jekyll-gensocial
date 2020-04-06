# frozen_string_literal: true

require "bundler/setup"
require "jekyll-gensocial"

SOURCE_DIR = File.expand_path("fixtures", __dir__)
DEST_DIR = File.expand_path("../tmp/dest", __dir__)

def source_dir(*files)
  File.join(SOURCE_DIR, *files)
end

def dest_dir(*files)
  File.join(DEST_DIR, *files)
end

CONFIG_DEFAULTS = {
  "source"      => source_dir,
  "destination" => dest_dir
}.freeze

def make_site(options = {})
  config = Jekyll.configuration CONFIG_DEFAULTS.merge(options)
  Jekyll::Site.new(config)
end

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = ".rspec_status"

  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end
