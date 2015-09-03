class Cms::CompositeItem

  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::History::Trackable
  include Mongoid::Orderable

  field :name,        type: String, localize: true
  field :root,        type: Boolean
  field :child_type,  type: String
  field :label,       type: String
  field :tags,        type: Array

  validates :name, presence: true, uniqueness: true

  # Track history
  track_history     :on => [:name, :label]

  
  # ordered list implementation for your mongoid models
  orderable

  belongs_to :list, polymorphic: true
 
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

  def type
    self.class.name.gsub("Cms::", "")
  end
  
end
