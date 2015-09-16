class Cms::CompositeComponent
  include Mongoid::Document
  include Cms::Composite
  include Cms::Named

  belongs_to :composite_hash, polymorphic: true
end
