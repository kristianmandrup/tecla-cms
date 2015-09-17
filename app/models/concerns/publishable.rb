module Publishable
  extend ActiveSupport::Concern

  included do
    include Cms::Workflowable

    field :workflow, type: String
    field :status, type: String
    field :comments, type: Array
  end

end
