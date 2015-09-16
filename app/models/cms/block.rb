class Cms::Block
  include Cms::Document
  include Cms::Named
  include Cms::Publishable
  include Cms::Listable
  include Cms::Renderable
  include Cms::Translatable
  include Cms::Describable
  include Cms::Taggable

  # Should reference another Block which is the prototype (blueprint)
  # used to construct this Block from.
  # The prototype can also be used for default template and layout etc.
  # TODO: FIX THIS!!! Write spec
  field :prototype,   type: String

  field :templates,   type: Array

  field :title,       type: String, localize: true
  field :summary,     type: String, localize: true
  field :content,     type: String, localize: true

  validates :title, presence: true
  validates :content, presence: true

  has_many :images, class_name: 'Cms::Image', as: :imageable
  has_many :generic_attributes, class_name: 'Cms::GenericAttribute',  as: :generic
  has_many :templates, class_name: 'Cms::Template', as: :templatable

  accepts_nested_attributes_for :generic_attributes , allow_destroy: true

  # track history
  track_history     :on => [:title, :description]

  has_and_belongs_to_many :block_lists, class_name: 'Cms::BlockList', inverse_of: :blocks
  belongs_to :named_block, class_name: 'Cms::NamedBlock', inverse_of: :block

  def as_json(options={})
    super(:only => [:title,:summary, :content], :methods => :type)
  end

  def localized_fields
    [:title, :summary, :content, :description]
  end
end
