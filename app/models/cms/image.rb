class Cms::Image
  include Concerned
  include_concerns :document, :translatable, :validatable,
                   :blueprintable, :publishable,
                   :taggable, :listable, :uploadable


  field :mime_description,   type: String

  localize_fields :title, :description

  belongs_to :imageable, polymorphic: true
  # has_many :templates, class_name: 'Cms::Template', as: :templatable

  # track history
  tracks :title, :content

  has_and_belongs_to_many :image_lists, class_name: 'Cms::ImageList', inverse_of: :images
  belongs_to :named_image, class_name: 'Cms::NamedImage', inverse_of: :image

  def as_json(options={})
    super(:only => api_attributes, :methods => :type)
  end

  def api_attributes
    [:title, :mime_description, :categories, :tags, :description, :content]
  end

  alias_method :url, :img_content_url
end
