class Cms::Named::Image < Cms::Named::Composite
  has_one :image, class_name: 'Cms::Image', inverse_of: :named_image
end
