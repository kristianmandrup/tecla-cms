class Cms::NamedItem

  include Mongoid::Document
  include Mongoid::Timestamps
  #include Cms::Listable

  field :name,   type: String

  validates :name, presence: true, uniqueness: true
  
end
