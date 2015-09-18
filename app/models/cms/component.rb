# A Component is a hash
class Cms::Component < Cms::Composite
  include ::Hashable
  include_concerns :named

  field :page, type: Boolean

  recursively_embeds_many

  has_many :templates, class_name: 'Cms::Template', as: :templatable
end
