class Cms::CompositeItem < Cms::Composite
  field :root,        type: Boolean
  field :child_type,  type: String
  belongs_to :list, polymorphic: true
end
