class Cms::List < Cms::CompositeItem
  #include Cms::Listable
  has_many :composite_items

  def set_hash
    hash = {}
    composite_items.each do |item|
      hash[item.name] = {}
      if item._type == "Cms::List"
        hash[item.name] = item.set_hash
      elsif item._type == "Cms::ListItem"
        hash[item.name] = item.name
      end
    end
    hash
  end
  
end
