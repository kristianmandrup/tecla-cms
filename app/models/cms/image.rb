class Cms::Image
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::History::Trackable
  include Mongoid::Orderable
  include Cms::Publishable 

  field :mime_description,   type: String
  field :title,              type: String, localize: true
  field :categories,         type: Array
  field :tags,               type: Array
  field :description,        type: String
  field :content,            type: String

  attr_accessor :picture, :image_cache
  mount_uploader :picture, ImageUploader

  validates :title, presence: true
  belongs_to :imageable, polymorphic: true

  # track history
  track_history     :on => [:title, :content]

  # ordered list implementation for your mongoid models
  orderable
  
  has_and_belongs_to_many :image_lists, class_name: "Cms::ImageList", inverse_of: :images
  belongs_to :named_image, class_name: "Cms::NamedImage", inverse_of: :image

  def as_json(options={})
    super(:only => [:title, :mime_description, :categories, :tags, :description, :content], :methods => :type)
  end

  def type
    self.class.name.gsub("Cms::", "")
  end
end
