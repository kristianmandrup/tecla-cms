require 'rails_helper'

class UniquelyNamedModel < Cms::Document
  include_concerns :uniquely_named
end

describe UniquelyNamed do
  pending 'todo'
end
