class Cms::List < Cms::CompositeItem
  include ::Hashable

  has_many :composite_items
  belongs_to :component, class_name: 'Cms::Component'
  has_many :templates, class_name: "Cms::Template", as: :templatable
end
