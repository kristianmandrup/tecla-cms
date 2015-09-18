class Cms::Image::List < Cms::Document
  include ::Hashable

  has_many :images, class_name: 'Cms::Image', inverse_of: :image_list
end
