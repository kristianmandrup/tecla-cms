class Cms::Composite < Cms::Document
  include_concerns :composite
  tracks :all
end