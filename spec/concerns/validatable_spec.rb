require 'spec_helper'

class ValidatableModel < Cms::Document
  incluede_concerns :validatable
end

describe Validatable do
  pending 'todo'
end