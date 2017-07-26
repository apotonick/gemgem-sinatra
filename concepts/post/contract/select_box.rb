require 'reform/form/dry'

module Post::Contract
  class SelectBox < Reform::Form
    feature Reform::Form::Dry

    property :select_basic_roles
    property :select_roles
    property :select_complex_roles
    property :select_multi_complex_roles
    property :is_public
    property :is_not_public
    property :check_roles

  end
end
