class Cms::BlockList < Cms::CompositeComponent
  include ::Hashable
  has_and_belongs_to_many :blocks, class_name: 'Cms::Block', inverse_of: :block_lists
  belongs_to :page, class_name: 'Cms::Page'
end
