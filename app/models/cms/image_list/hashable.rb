module Cms::ImageList::Hashable
  def set_hash
    hash = {}
    hash[self.name] = images_hash
  end

  private

  # FIX: why only title!? We want the image_url exposed by the API as well!!
  def images_hash
    self.images.collect{ |img| img.as_json(only: [:title], methods: :type)}
  end
end