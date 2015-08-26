class Cms::HashList < Cms::CompositeHashItem

  has_many :composite_hash_items , as: :composite_hash
  
  
  
  def set_hash
    hash = {}
    composite_hash_items.each do |item|
      hash[item.name] = {}
      if item._type == "Cms::HashList"
        hash[item.name] = item.set_hash
      elsif item._type == "Cms::BlockList"
        hash[item.name] = item.blocks.collect{ |block| block.as_json(only: [:title])}
      elsif item._type == "Cms::ImageList"
        hash[item.name] = item.images.collect{ |image| image.as_json(only: [:title])}
      elsif item._type == "Cms::NamedBlock"
        hash[item.name] = item.block.as_json(only: [:title])
      elsif item._type == "Cms::NamedImage"
        hash[item.name] = item.image.as_json(only: [:title])
      end
    end
    hash
  end
  
end
