class Cms::Model::Validator < ActiveModel::Validator
  attr_reader :record

  def validate record
    @record = record
    # do your runtime validation magic!
  end

  protected

end