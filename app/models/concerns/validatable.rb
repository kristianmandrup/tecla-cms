module Validatable
  extend ActiveSupport::Concern

  included do
    self.fields.keys.each do |name|
      validate_field name
    end
  end

  class_methods do
    def validate_field name
      required_field(name) # || ...
    end

    def required_field name
      validates name, presence: true if required_field? name
    end

    def required_field? name
      required_fields.include? name
    end

    def required_fields
      [:name, :title, :content]
    end
  end
end