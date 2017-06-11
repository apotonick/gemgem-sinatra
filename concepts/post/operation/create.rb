require_relative "../../../models/post"
require 'reform/form/dry'

class Post::Create < Trailblazer::Operation
  contract do
    property :title
    property :url_slug
    property :content
    property :is_public, virtual: true
    property :owner
    property :roles
    property :select_roles, from: :roles

    include Reform::Form::Dry::Validations

    validation :default do
      key(:title, &:filled?)
      key(:select_roles, &:filled?)
      key(:url_slug) { |slug| slug.format?(/^[\w-]+$/) & slug.unique? }
      key(:content) { |content| content.max_size?(10) } # i know that a real blog post should be a bit more elaborating.

      key(:roles) { |roles| roles.size?(2) }

      configure do
        config.messages_file = 'concepts/post/operation/dry_error_messages.yml'

        def unique?(value)
          form.model.class[url_slug: value].nil?
        end
      end
    end
  end

  def model!(*)
    Post.new
  end

  def process(params)
    puts "@@@@@ #{params.inspect}"
    validate(params) do
      contract.save
    end
  end
end
