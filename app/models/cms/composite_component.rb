class Cms::CompositeComponent
  include Mongoid::Document
  include Composite
  include Named

  belongs_to :composite_hash, polymorphic: true
end
