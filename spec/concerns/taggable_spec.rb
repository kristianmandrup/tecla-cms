require 'rails_helper'

class TaggableModel < Cms::Document
  include_concerns :taggable
end

describe Taggable do
  pending 'todo'
end
