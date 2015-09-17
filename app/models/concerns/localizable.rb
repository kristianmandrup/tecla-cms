module Localizable
  extend ActiveSupport::Concern

  included do
    def fields_localized
      self.class.fields_localized
    end
  end

  class_methods do
    def localized_field name
      field name, type: String, localize: true
      fields_localized << name
    end

    def localize_fields *names
      names.each {|name| localized_field name }
    end

    def fields_localized
      @fields_localized ||= []
    end
  end
end
