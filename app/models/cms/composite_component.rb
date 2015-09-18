class Cms::CompositeComponent < Cms::Composite
  belongs_to :composites, polymorphic: true
end
