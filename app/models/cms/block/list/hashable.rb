module Cms::BlockList::Hashable
  def set_hash
    hash = {}
    hash[self.name] = block_hash
  end

  private

  def block_hash
    self.blocks.collect{ |block| block.as_json(only: [:title])}
  end
end