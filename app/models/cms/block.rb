class Cms::Block
  include Concerned
  include_concerns :document, :named, :publishable,
                   :listable, :renderable, :translatable,
                   :describable, :taggable

  # TODO: Prototype pattern should be generalized via concern or class method
  # http://stackoverflow.com/questions/6535898/mongodb-mongoid-self-reference-relationship
  belongs_to :prototype, class_name: 'Cms::Block', :inverse_of => :blueprints
  has_many :blueprints, class_name: 'Cms::Block', :inverse_of => :prototype

  localized_fields :title, :summary, :content

  # TODO: optimize via DSL!
  validates :title, presence: true
  validates :content, presence: true

  has_many :images, class_name: 'Cms::Image', as: :imageable

  has_many :templates, class_name: 'Cms::Template', as: :templatable

  # TODO: concern
  has_many :generic_attributes, class_name: 'Cms::GenericAttribute',  as: :generic
  accepts_nested_attributes_for :generic_attributes , allow_destroy: true

  # track history
  track_history     :on => [:title, :description]

  has_and_belongs_to_many :block_lists, class_name: 'Cms::BlockList', inverse_of: :blocks
  belongs_to :named_block, class_name: 'Cms::NamedBlock', inverse_of: :block

  def as_json(options={})
    super(:only => [:title,:summary, :content], :methods => :type)
  end
end
