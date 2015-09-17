module Publishable
  extend ActiveSupport::Concern

  included do
    include Workflowable

    field :state, type: String
    field :status, type: String
    field :comments, type: Array
  end

end
