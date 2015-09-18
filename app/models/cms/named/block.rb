class Cms::Named::Block < Cms::Named::Composite
  has_one :block, class_name: "Cms::Block", inverse_of: :named_block
end
