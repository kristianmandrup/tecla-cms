class Cms::NamedBlock < Cms::NamedItem  
  has_one :block, class_name: "Cms::Block", inverse_of: :named_block
end
