class Cms::NamedImage < Cms::NamedItem

  belongs_to :image, class_name: "Cms::NamedImage", inverse_of: :images
  
end
