class Cms::Layout
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::History::Trackable
  include Mongoid::Orderable
  include Publishable
  include Translatable
  include Named

  field :type,        type: String, :default => 'block'
  field :language,    type: String, :default => 'liquid'
  field :tags,        type: Array
  field :template,    type: String
  field :categories,  type: Array
  field :description, type: String

  validates :type, presence: true

  def self.layout(layout_name)
    (layout_name.blank?) ? self.first : self.find_by(:name => layout_name)
  end

  def localized_fields
    [:description]
  end
end
