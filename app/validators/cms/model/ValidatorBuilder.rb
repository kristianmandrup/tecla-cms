class Cms::Model::ValidatorBuilder
  attr_reader :model

  def initialize model
    @model = model
    field_validations!
  end

  def field_validator model, name
    Cms::Model::FieldValidator.new model, name
  end

  def add_validations name
    field_validator(model, name.to_sym).add_validations
  end

  def field_validations!
    model.fields.keys.each do |name|
      add_validations name
    end
  end
end