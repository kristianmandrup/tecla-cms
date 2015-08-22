module Cms::Publishable
  extend ActiveSupport::Concern

  included do
    field :workflow, type: String
    field :status, type: String
    field :comments, type: Array
  end

end
