class Cms::Component < Cms::CompositeComponent

  has_many :composite_components , as: :composite_hash
  has_many :lists,   class_name: 'Cms::List'
  has_many :templates, class_name: "Cms::Template", as: :templatable
  
  field :page, type: Boolean

  def set_hash
    hash = {}
    hash['type'] = self.type
    composite_components.each do |item|
      set_hash_by item, hash
    end
    hash
  end

  def set_hash_by item, hash
    hash[item.name] = {}
    hash[item.name]['type'] = item.type if item.type

    case item._type
    when 'Cms::Component'
      hash[item.name] = item.set_hash
    when 'Cms::BlockList'
      hash[item.name]['blocks'] = blocks_hash item
    when 'Cms::ImageList'
      hash[item.name]['images'] = images_hash item
    when 'Cms::NamedBlock'
      hash[item.name]['block'] = block_hash item
    when 'Cms::NamedImage'
      hash[item.name]['image'] = image_hash item
    end
  end

  private

  def image_hash item
    item.image.as_json(only: [:title], methods: [:type])
  end

  def block_hash item
    item.block.as_json(only: [:title], methods: [:type])
  end

  def images_hash item
    item.images.collect{ |image| image.as_json(only: [:title], methods: [:type])}
  end

  def blocks_hash item
    item.blocks.collect{ |block| block.as_json(only: [:title], methods: [:type])}
  end
end
