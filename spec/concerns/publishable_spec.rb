require 'rails_helper'

class PublishableModel < Cms::Document
  incluede_concerns :publishable
end

describe Publishable do
  pending 'todo'
end
