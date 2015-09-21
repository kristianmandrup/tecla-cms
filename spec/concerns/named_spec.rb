require 'rails_helper'

class NamedModel < Cms::Document
  include_concerns :named
end

describe Named do
  pending 'todo'
end
