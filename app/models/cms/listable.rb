module Cms::Listable
  include Cms::Publishable
  extend ActiveSupport::Concern

  included do
    #clazz.embedded_in :listable, polymorphic: true
    field :name, type: String
    field :order, type: Integer
    field :description, type: Array
  end

end
