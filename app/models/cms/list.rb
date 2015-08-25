class Cms::List < Cms::CompositeItem

  has_many :composite_items, as: :composable

end
