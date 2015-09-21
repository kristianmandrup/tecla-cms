class Cms::Menu < Cms::Document
  include ::Hashable
  include_concerns :uniquely_named

  embeds_many :menu_items, class_name: 'Cms::Menu::Item', inverse_of: :menu
end
