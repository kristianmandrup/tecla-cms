class Cms::ListItem < Cms::CompositeItem
  # a link can point to different resource depending on locale
  localized_fields :label, :link
end
