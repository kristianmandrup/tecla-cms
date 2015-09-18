class Cms::Image < Cms::Document
  include_concerns :content_item
                   :listable, :uploadable

  field :mime_type, type: String

  belongs_to :imageable, polymorphic: true
  # has_many :templates, class_name: 'Cms::Template', as: :templatable

  has_and_belongs_to_many :image_lists, class_name: 'Cms::ImageList', inverse_of: :images
  belongs_to :named_image, class_name: 'Cms::NamedImage', inverse_of: :image

  def my_api_attributes
    [:mime_type]
  end

  alias_method :url, :img_content_url
end
