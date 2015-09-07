class Cms::BlockList < Cms::CompositeHashItem

  has_and_belongs_to_many :blocks, class_name: "Cms::Block", inverse_of: :block_lists
  belongs_to :page, class_name: "Cms::Page"
  #belongs_to :composite_hash, polymorphic: true

  def set_hash
    hash = {}
    hash[self.name] = block_hash
  end

  private

  def block_hash
    self.blocks.collect{ |block| block.as_json(only: [:title])}
  end
end
