# Abstract class: Only subclass
# TODO: throw error if instantiated directly!
class Cms::Document
  include Concerned
  include_concerns :document, :metadata
end