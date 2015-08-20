module Cms::Publishable
  extend ActiveSupport::Concern

  def self.included(clazz)
    clazz.field :workflow, type: String
    clazz.field :status, type: String
    clazz.field :comments, type: Array
  end

end