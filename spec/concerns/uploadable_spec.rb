require 'spec_helper'

class UploadableModel < Cms::Document
  incluede_concerns :uploadable
end

describe Uploadable do
  pending 'todo'
end