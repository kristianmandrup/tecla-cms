class Cms::Menu::Item < Cms::Composite
  # a link can point to different resource depending on locale
  localized_fields :label, :link
  text_field :icon

  embeds_one :image, class_name: 'Cms::Image', as: :imageable, polymorphic: true
  embedded_in :menu, class_name: 'Cms::Menu', inverse_of: :menu_items
end
