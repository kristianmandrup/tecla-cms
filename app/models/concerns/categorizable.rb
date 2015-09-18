module Categorizable
  extend ActiveSupport::Concern

  included do
    field :categories,  type: Array
  end
end