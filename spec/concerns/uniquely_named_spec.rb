require 'spec_helper'

class UniquelyNamedModel < Cms::Document
  incluede_concerns :uniquely_named
end

describe UniquelyNamed do
  pending 'todo'
end