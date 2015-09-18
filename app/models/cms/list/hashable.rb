module Cms::List::Hashable
  def set_hash
    hash = {}
    hash['type'] = self.type
    hash['list_items'] = list_items_hash
    composite_items.where(_type: 'Cms::List').each do |item|
      hash[item.name] = {}
      hash[item.name] = item.set_hash
    end
    hash
  end

  private

  def list_items_hash
    composite_items.where(_type: 'Cms::ListItem').as_json(only: [:name], methods: [:type])
  end
end