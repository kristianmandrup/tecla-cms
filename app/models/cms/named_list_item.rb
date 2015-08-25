class Cms::NamedListItem < Cms::NamedItem

  belongs_to :image, class_name: "Cms::NamedListItem", inverse_of: :list_items
  
end
