require 'spec_helper'

class TranslatableModel < Cms::Document
  incluede_concerns :translatable
end

describe Translatable do
  pending 'todo'
end