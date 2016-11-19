require_relative "../../../models/post"

class Post::Create < Trailblazer::Operation
  contract do
    property :title
    property :url_slug
    property :content

    include Reform::Form::Dry::Validations

    validation :default do
      configure do
        def unique?(value)
          form.model.class[url_slug: value].nil?
        end
        config.messages_file = 'concepts/post/operation/dry_error_messages.yml'
      end

      required(:title).value(:filled?)
      required(:url_slug).value(format?: /^[\w-]+$/)
      required(:url_slug).filled(:unique?)
    end
  end

  def model!(*)
    Post.new
  end

  def process(params)
    validate(params) do
      contract.save
    end
  end
end
