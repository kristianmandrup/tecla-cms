class Cms::ImageList < Cms::CompositeComponent
  include ::Hashable
  has_and_belongs_to_many :images, class_name: 'Cms::Image', inverse_of: :image_lists
  belongs_to :page, class_name: 'Cms::Page'
end
