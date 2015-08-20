class Cms::ListItem
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::History::Trackable
  include Mongoid::Orderable

  
  field :label,       type: String, localize: true
  field :icon,        type: String
  field :link,        type: String

  validates :label, presence: true
  # Track history
  track_history     :on => [:link, :label]  

  # ordered list implementation for your mongoid models
  orderable
end
