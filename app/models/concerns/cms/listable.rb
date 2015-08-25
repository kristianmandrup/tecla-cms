module Cms::Listable
  extend ActiveSupport::Concern
  #include Cms::Publishable

  included do
    embedded_in :listable, class_name: "Cms::List", polymorphic: true
    field :name, type: String
    field :order, type: Integer
    field :description, type: Array
  end

end
