module Describable
  extend ActiveSupport::Concern

  included do
    # used for authors to descibe what is being edited, not for display
    field :description, type: String, localize: true
  end
end