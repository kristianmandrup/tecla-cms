require 'spec_helper'

class CategorizedModel < Cms::Document
  incluede_concerns :categorizable
end

describe Blueprintable do
  it 'should have categories' do
    pending 'todo'
  end
end