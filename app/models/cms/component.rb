class Cms::Component < Cms::CompositeComponent
  include ::Hashable
  include_concerns :content_item

  field :page, type: Boolean

  has_many :composite_components , as: :composites
  has_many :lists,   class_name: 'Cms::List'
  has_many :templates, class_name: 'Cms::Template', as: :templatable
end
