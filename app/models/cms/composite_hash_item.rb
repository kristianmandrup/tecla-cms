class Cms::CompositeHashItem
  include Mongoid::Document

  field :name,        type: String, localize: true

  validates :name, presence: true, uniqueness: true
  
end
