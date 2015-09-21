require 'rails_helper'

class BlueprintModel < Cms::Document
  include_concerns :blueprintable
end

describe Blueprintable do
  pending 'todo'
end
