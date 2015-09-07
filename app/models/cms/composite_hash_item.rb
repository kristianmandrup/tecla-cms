class Cms::CompositeHashItem
  include Mongoid::Document
  include Cms::Composite

  field :name, type: String, localize: true

  validates :name, presence: true, uniqueness: true

  belongs_to :composite_hash, polymorphic: true
end
