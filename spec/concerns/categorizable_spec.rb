require 'rails_helper'

class CategorizedModel < Cms::Document
  include_concerns :categorizable
end

describe Blueprintable do
  it 'should have categories' do
    pending 'todo'
  end
end
