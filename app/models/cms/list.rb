class Cms::List
  include Cms::Document
  #include Cms::Listable

  field :name,        type: String, localize: true
  field :root,        type: Boolean
  field :child_type,  type: String
  field :label,       type: String
  field :tags,        type: Array

  #embeds_many :items, as: :listable
  validates :name, presence: true

  # Track history
  track_history     :on => [:name, :label]

  
  # ordered list implementation for your mongoid models
  orderable
end
