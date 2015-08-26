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

  validates :name, presence: true

  # Track history
  track_history     :on => [:name, :label]

  
  # ordered list implementation for your mongoid models
  orderable

  belongs_to :list, polymorphic: true
 
end
