require 'rails_helper'

class ExtendableModel < Cms::Document
  include_concerns :extendable
end

describe Extendable do
  pending 'todo'
end
