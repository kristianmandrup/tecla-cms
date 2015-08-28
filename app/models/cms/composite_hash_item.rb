class Cms::CompositeHashItem
  include Mongoid::Document

  field :name,        type: String, localize: true

  validates :name, presence: true, uniqueness: true
  
  belongs_to :composite_hash, polymorphic: true
  
  def self.get_all_lists(skip_null)
    list_array = []
    self.all.each do |list|
      if skip_null
        list_array << {list.name => list.set_hash}.compact
      else
        list_array << {list.name => list.set_hash}
      end
    end
    list_array
  end
  
  def self.get_list_by_name(name)
    find_by(:name => name)
  end
  
  
end
