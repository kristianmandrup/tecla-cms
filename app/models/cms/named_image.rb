class Cms::NamedImage < Cms::NamedItem

  has_one :image, class_name: "Cms::Image", inverse_of: :named_image
  
end
