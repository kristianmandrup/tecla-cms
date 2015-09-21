require 'rails_helper'

class CategorizedModel < Cms::Document
  include_concerns :categorizable
end

describe Categorizable do
  it 'should have categories' do
    
  end
end
