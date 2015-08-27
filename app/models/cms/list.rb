class Cms::List < Cms::CompositeItem
  #include Cms::Listable
  has_many :composite_items
  belongs_to :page, class_name: "Cms::Page"
  
  def set_hash
    hash = {}
    hash["list_items"] = []
    composite_items.each do |item|
      if item._type == "Cms::List"
        hash[item.name] = {}
        hash[item.name] = item.set_hash
      elsif item._type == "Cms::ListItem"
        hash["list_items"] << item.as_json(only: [:name])
      end
    end
    hash
  end
  
end
