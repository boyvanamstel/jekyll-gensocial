# frozen_string_literal: true

module Jekyll
  module Gensocial
    class Generator < Jekyll::Generator
      safe true
      priority :lowest

      def generate(site)
        config = Utils.deep_merge_hashes(
          Gensocial::DEFAULTS,
          site.config.fetch("jekyll-gensocial", {})
        )

        return unless config["enabled"] == true

        process_docs(site.pages, :site => site, :config => config)
        process_docs(site.posts.docs, :site => site, :config => config)
      end

      private

      def process_docs(docs, site:, config:)
        docs.each do |doc|
          doc_config = Utils.deep_merge_hashes(config, doc.data.fetch("jekyll-gensocial", {}))
          process_doc(doc, :site => site, :config => doc_config)
        end
      end

      def image_config(config, base_path:)
        {
          :size => Geometry::Size.new(config["size"]),
          :text => ImageCreator::TextLayerConfig.new(
            config["text"],
            :base_path => base_path
          ),
          :bg   => ImageCreator::BackgroundLayerConfig.new(
            config["background"],
            :base_path => base_path
          ),
        }
      end

      def process_doc(doc, site:, config:)
        image_config = image_config(config, :base_path => site.source)

        text = doc.data["title"] || image_config[:text].string
        image_path = doc.data["image"]

        return if text.nil? || image_path.nil?

        write_image(
          :path         => site.in_source_dir(image_path),
          :text         => text,
          :image_config => image_config
        )

        base = site.source
        dir = File.dirname(image_path)
        name = File.basename(image_path)

        site.static_files << Jekyll::StaticFile.new(site, base, dir, name)
      end

      def write_image(path:, text:, image_config:)
        image = get_image_creator(
          :text         => text,
          :image_config => image_config
        ).image

        image.write(path)
      end

      def get_image_creator(text:, image_config:)
        image_creator = ImageCreator::Composer.new(:image_size => image_config[:size])
        image_creator.add_bg_layer(:config => image_config[:bg])
        image_creator.add_text_layer(text, :config => image_config[:text])

        image_creator
      end
    end
  end
end
