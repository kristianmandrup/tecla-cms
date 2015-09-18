# A Component is a hash
class Cms::Component < Cms::Composite
  include ::Hashable

  field :page, type: Boolean

  has_many :templates, class_name: 'Cms::Template', as: :templatable
end
