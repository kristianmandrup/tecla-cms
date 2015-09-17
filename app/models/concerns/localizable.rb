module Localizable
  extend ActiveSupport::Concern

  included do
    # used for authors to descibe what is being edited, not for display
  end

  class_methods do
    def localized_field name
      field name, type: String, localize: true
      fields_localized << name
    end

    def localized_fields *names
      names.each {|name| localized_field name }
    end

    def fields_localized
      @fields_localized ||= {}
    end
  end
end