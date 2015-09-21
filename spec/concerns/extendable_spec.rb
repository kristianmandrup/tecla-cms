require 'rails_helper'

class ExtendableModel < Cms::Document
  incluede_concerns :extendable
end

describe Extendable do
  pending 'todo'
end
