class Cms::HashList < Cms::CompositeHashItem

  has_many :composite_hash_items , as: :composite_hash
  belongs_to :page, class_name: "Cms::Page"
  
  
  def set_hash
    hash = {}
    hash["type"] = self.type
    composite_hash_items.each do |item|
      hash[item.name] = {}
      if item._type == "Cms::HashList"
        hash[item.name] = item.set_hash
      elsif item._type == "Cms::BlockList"
        hash[item.name] = {}
        hash[item.name]["type"] = item.type
        hash[item.name]["blocks"] = item.blocks.collect{ |block| block.as_json(only: [:title], methods: [:type])}
      elsif item._type == "Cms::ImageList"
        hash[item.name] = {}
        hash[item.name]["type"] = item.type
        hash[item.name]["images"] = item.images.collect{ |image| image.as_json(only: [:title], methods: [:type])}
      elsif item._type == "Cms::NamedBlock"
         hash[item.name] = {}
        hash[item.name]["type"] = item.type
        hash[item.name]["block"] = item.block.as_json(only: [:title], methods: [:type])
      elsif item._type == "Cms::NamedImage"
        hash[item.name] = {}
        hash[item.name]["type"] = item.type
        hash[item.name]["image"] = item.image.as_json(only: [:title], methods: [:type])
      end
    end
    hash
  end
  
end
