class Cms::ImageList < Cms::CompositeHashItem

  has_and_belongs_to_many :images, class_name: "Cms::Image", inverse_of: :image_lists
  #belongs_to :composite_hash, polymorphic: true
  
  def set_hash
    hash = {}
    hash[self.name] = self.images.collect{ |img| img.as_json(only: [:name])}
  end
  
end
