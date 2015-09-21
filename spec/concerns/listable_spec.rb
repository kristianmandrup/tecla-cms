require 'rails_helper'

class ListableModel < Cms::Document
  include_concerns :listable
end

describe Listable do
  pending 'todo'
end
