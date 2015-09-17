class Cms::ListItem < Cms::CompositeItem
  include Translatable

  # the label displayed for a menu item, tab or similar
  field :label,       type: String, localize: true
  field :icon,        type: String

  # a link can point to different resource depending on locale
  field :link,        type: String, localize: true

  validates :label, presence: true

  def localized_fields
    [:label, :link]
  end
end
