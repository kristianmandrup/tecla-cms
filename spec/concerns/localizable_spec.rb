require 'rails_helper'

class LocalizableModel < Cms::Document
  include_concerns :localizable
end

describe Localizable do
  pending 'todo'
end
