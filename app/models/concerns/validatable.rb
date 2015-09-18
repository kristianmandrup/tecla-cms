module Validatable
  extend ActiveSupport::Concern

  included do
    # validate_fields!
    include ActiveModel::Validations

    # advanced runtime record validation goes here!!
    validates_with Cms::Model::Validator

    fields_validation
  end

  class_methods do
    # build validation methods for this class :)
    def fields_validation
      Cms::Model::ValidatorBuilder.new self
    end
  end
end