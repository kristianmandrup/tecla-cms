class Cms::Image < Cms::Document
  include_concerns :content_item, :templates
                   :listable, :uploadable

  field :mime_type, type: String

  belongs_to :imageable, polymorphic: true

  belongs_to :image_list, class_name: 'Cms::ImageList', inverse_of: :images
  belongs_to :named_image, class_name: 'Cms::NamedImage', inverse_of: :image

  def my_api_attributes
    [:mime_type]
  end

  alias_method :url, :img_content_url
end
