class Cms::List < Cms::CompositeItem
  #include Cms::Listable
  has_many :composite_items
  belongs_to :page, class_name: "Cms::Page"
  
  def set_hash
    hash = {}
    hash["list_items"] = composite_items.where(_type: "Cms::ListItem").as_json(only: [:name])
    composite_items.where(_type: "Cms::List").each do |item|
        hash[item.name] = {}
        hash[item.name] = item.set_hash
    end
    hash
  end
  
end
