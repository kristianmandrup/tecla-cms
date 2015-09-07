class Cms::ImageList < Cms::CompositeHashItem

  has_and_belongs_to_many :images, class_name: 'Cms::Image', inverse_of: :image_lists
  #belongs_to :composite_hash, polymorphic: true
  belongs_to :page, class_name: 'Cms::Page'

  def set_hash
    hash = {}
    hash[self.name] = images_hash
  end

  private

  def images_hash
    self.images.collect{ |img| img.as_json(only: [:title], methods: :type)}
  end
end
