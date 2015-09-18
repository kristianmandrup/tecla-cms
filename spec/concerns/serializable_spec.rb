require 'spec_helper'

class SerializableModel < Cms::Document
  incluede_concerns :serializable
end

describe Serializable do
  pending 'todo'
end