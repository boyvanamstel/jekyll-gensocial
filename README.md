# Jekyll Gensocial

[![Gem Version](https://badge.fury.io/rb/jekyll-gensocial.svg)](https://badge.fury.io/rb/jekyll-gensocial)

A Jekyll plugin that automatically generates images that can be used to share on social media.

## Installation

First install Imagemagick and GhostScript (for fonts):

```bash
brew install pkg-config imagemagick gs
```

Add `gem "jekyll-gensocial"` to the `:jekyll_plugins` group in your `Gemfile`:

```ruby
# Gemfile

group :jekyll_plugins do
  gem "jekyll-gensocial"
end
```

Then add these lines to your application's `_config.yml`:

```yml
# _config.yml

plugins:
  - jekyll-gensocial
```

## Usage

## Purpose

## Development

After checking out the repo, run `script/bootstrap` to install dependencies. Then, run `bundle exec rake spec` to run the tests.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `lib/jekyll-gensocial/version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/boyvanamstel/jekyll-gensocial. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to behave appropriately.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
