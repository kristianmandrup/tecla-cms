class Cms::NamedBlock < Cms::NamedComposite
  has_one :block, class_name: "Cms::Block", inverse_of: :named_block
end
