class Cms::Layout
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::History::Trackable
  include Mongoid::Orderable
  include Cms::Publishable

  CATEGORIES = %w(Apparel Media Software Sports Agri Education)
  TAGS = %w(banner, football)
  TYPE = %w(page, block)
  LANGUAGE = %w(liquid)
  
  field :name,        type: String
  field :type,        type: String, localize: true, :default => 'block'
  field :language,    type: String, :default => 'liquid'
  field :tags,        type: Array
  field :template,    type: String
  field :presenter,   type: String
  field :categories,  type: Array
  field :description, type: String

  validates :type, presence: true
  
  def self.get_layout(layout_name)
    (layout_name.blank?) ? self.first : self.find_by(:name => layout_name)
  end

end
