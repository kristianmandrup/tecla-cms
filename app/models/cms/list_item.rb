class Cms::ListItem < Cms::CompositeItem
  
  field :label,       type: String, localize: true
  field :icon,        type: String
  field :link,        type: String


end
