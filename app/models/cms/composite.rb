# Abstract class
# TODO: throw error if instantiated directly!
class Cms::Composite < Cms::Document
  include_concerns :composite
end
