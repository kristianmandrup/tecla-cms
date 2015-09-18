module Publishable
  extend ActiveSupport::Concern

  included do
    include Workflowable

    field :status, type: String

    # Comments should be stored in Redis DB, keyed by model instance _id
  end
end
