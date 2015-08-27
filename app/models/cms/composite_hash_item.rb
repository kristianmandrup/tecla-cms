class Cms::CompositeHashItem
  include Mongoid::Document

  field :name,        type: String, localize: true

  validates :name, presence: true, uniqueness: true
  
  belongs_to :composite_hash, polymorphic: true
  
  def self.get_all_lists
    list_array = []
    self.all.each do |list|
      list_array << {list.name => list.set_hash}
    end
    list_array
  end
  
  def self.get_list_by_name(name)
    find_by(:name => name)
  end
  
  
end
