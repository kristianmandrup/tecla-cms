class Cms::ListItem < Cms::CompositeItem
  
  field :label,       type: String, localize: true
  field :icon,        type: String
  field :link,        type: String

   validates :label, presence: true
end
