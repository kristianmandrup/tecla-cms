module Publishable
  extend ActiveSupport::Concern

  included do
    include Workflowable

    field :workflow, type: String
    field :status, type: String
    field :comments, type: Array
  end

end
