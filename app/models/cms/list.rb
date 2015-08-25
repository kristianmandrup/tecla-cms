class Cms::List
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::History::Trackable
  include Mongoid::Orderable

  field :name,        type: String, localize: true
  field :root,        type: Boolean
  field :child_type,  type: String
  field :label,       type: String
  field :tags,        type: Array

  embeds_many :named_items, class_name: "Cms::NamedItem", as: :listable
  validates :name, presence: true

  # Track history
  track_history     :on => [:name, :label]

  
  # ordered list implementation for your mongoid models
  orderable
end
