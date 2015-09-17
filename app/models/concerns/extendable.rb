module Extensible
  extend ActiveSupport::Concern

  included do
    has_many :generic_attributes, class_name: 'Cms::GenericAttribute',  as: :generic
    accepts_nested_attributes_for :generic_attributes , allow_destroy: true
  end
end