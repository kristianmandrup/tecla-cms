module Cms::Listable
  include Cms::Publishable
  extend ActiveSupport::Concern
  
  def self.included(clazz)
    #clazz.embedded_in :listable, polymorphic: true
    clazz.field :name, type: String
    clazz.field :order, type: Integer
    clazz.field :description, type: Array
  end

end
