require 'rails_helper'

class TranslatableModel < Cms::Document
  include_concerns :translatable
end

describe Translatable do
  pending 'todo'
end
