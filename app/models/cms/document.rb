class Cms::Document
  include Concerned
  include_concerns :document, :named, :metadata
end