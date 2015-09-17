module Listable
  extend ActiveSupport::Concern
  #include Cms::Publishable

  included do
    include Mongoid::Orderable

    field :order, type: Integer

    # ordered list implementation for your mongoid models
    orderable
  end

end
