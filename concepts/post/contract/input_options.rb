require 'reform/form/dry'

module Post::Contract
  class InputOptions < Reform::Form
    feature Reform::Form::Dry

    property :id
    property :email
    property :password
    property :image
    property :background_color
    property :number

  end
end
