class Cms::List < Cms::Document
  include ::Hashable

  has_many :list_items, class_name: 'Cms::ListItem', inverse_of: :list
end
