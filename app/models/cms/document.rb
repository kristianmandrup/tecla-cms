class Cms::Document
  include Concerned
  include_concerns :document, :listable
  include Named
  orderable
end