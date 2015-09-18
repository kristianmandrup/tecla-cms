require 'spec_helper'

class ListableModel < Cms::Document
  incluede_concerns :listable
end

describe Listable do
  pending 'todo'
end