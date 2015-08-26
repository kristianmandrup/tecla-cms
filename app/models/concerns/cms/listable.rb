module Cms::Listable
  extend ActiveSupport::Concern
  #include Cms::Publishable

  included do
    field :name, type: String
    field :order, type: Integer
    field :description, type: Array
  end

end
