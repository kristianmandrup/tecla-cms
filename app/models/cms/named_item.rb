class Cms::NamedItem < Cms::CompositeHashItem

  #include Cms::Listable
  belongs_to :composite_hash, polymorphic: true
  
end
