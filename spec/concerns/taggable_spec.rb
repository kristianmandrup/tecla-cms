require 'spec_helper'

class TaggableModel < Cms::Document
  incluede_concerns :taggable
end

describe Taggable do
  pending 'todo'
end