require 'rails_helper'

class PublishableModel < Cms::Document
  include_concerns :publishable
end

describe Publishable do
  pending 'todo'
end
