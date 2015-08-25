class Cms::HashList < Cms::CompositeHashItem

  embed_many :composite_hash_items, as: :composite_hash

end
