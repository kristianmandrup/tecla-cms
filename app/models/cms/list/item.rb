class Cms::List::Item < Cms::Composite
  # a link can point to different resource depending on locale
  localized_fields :label, :link

  belongs_to :list, class_name: 'Cms::List', inverse_of: :list_items
end
