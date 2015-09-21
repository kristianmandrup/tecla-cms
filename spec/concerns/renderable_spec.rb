require 'rails_helper'

class RenderableModel < Cms::Document
  include_concerns :renderable
end

describe Renderable do
  pending 'todo'
end
