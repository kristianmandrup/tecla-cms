class Cms::ListItem
  include Cms::Document
  include Cms::Listable

  
  field :label,       type: String, localize: true
  field :icon,        type: String
  field :link,        type: String

  validates :label, presence: true
  # Track history
  track_history     :on => [:link, :label]  

  # ordered list implementation for your mongoid models
  orderable
end
