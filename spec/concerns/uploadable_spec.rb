require 'rails_helper'

class UploadableModel < Cms::Document
  include_concerns :uploadable
end

describe Uploadable do
  pending 'todo'
end
