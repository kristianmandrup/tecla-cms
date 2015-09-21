require 'rails_helper'

class ValidatableModel < Cms::Document
  include_concerns :validatable
end

describe Validatable do
  pending 'todo'
end
