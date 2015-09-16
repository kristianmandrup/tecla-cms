class Cms::CompositeItem
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::History::Trackable
  include Cms::Listable
  include Cms::Composite
  include Cms::Named

  field :root,        type: Boolean
  field :child_type,  type: String

  # this is the key
  field :label,       type: String
  field :tags,        type: Array

  # Track history
  track_history     :on => [:name, :label]

  belongs_to :list, polymorphic: true
end
