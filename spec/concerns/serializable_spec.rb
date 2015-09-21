require 'rails_helper'

class SerializableModel < Cms::Document
  include_concerns :serializable
end

describe Serializable do
  pending 'todo'
end
