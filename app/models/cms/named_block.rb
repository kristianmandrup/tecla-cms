class Cms::NamedBlock < Cms::NamedItem

  belongs_to :block, class_name: "Cms::NamedItem", inverse_of: :blocks
  
end
