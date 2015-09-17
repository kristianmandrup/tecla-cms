module Localizable
  extend ActiveSupport::Concern

  included do
    # used for authors to descibe what is being edited, not for display
    def_method :localized_field |name|
      field name, type: String, localize: true
    end
  end
end