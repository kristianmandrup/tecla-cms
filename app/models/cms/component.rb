class Cms::Component < Cms::CompositeComponent
  include Concerned
  include_concerns :content_item
  include ::Hashable

  has_many :composite_components , as: :composite_hash
  has_many :lists,   class_name: 'Cms::List'
  has_many :templates, class_name: 'Cms::Template', as: :templatable

  field :page, type: Boolean
end
