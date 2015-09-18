class Cms::Block::List < Cms::Composite
  include ::Hashable
  has_many :blocks, class_name: 'Cms::Block', inverse_of: :block_lists
end
