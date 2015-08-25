class Cms::BlockList < Cms::CompositeHashItem

  has_and_belongs_to_many :blocks, class_name: "Cms::Block", inverse_of: :block_lists
  belongs_to :composite_hash, polymorphic: true
  
end
