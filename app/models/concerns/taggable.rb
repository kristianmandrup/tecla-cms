module Taggable
  extend ActiveSupport::Concern

  included do
    field :categories,  type: Array
    field :tags,        type: Array
  end
end