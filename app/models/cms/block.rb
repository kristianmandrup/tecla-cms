class Cms::Block
  include Concerned
  include_concerns :document, :named, :publishable,
                   :listable, :renderable, :translatable,
                   :describable, :taggable, :extendable, :blueprintable

  localized_fields :title, :summary, :content

  blueprint 'Cms::Block'


  # TODO: concern
  has_many :images, class_name: 'Cms::Image', as: :imageable

  # TODO: concern
  has_many :templates, class_name: 'Cms::Template', as: :templatable

  # TODO: encapsulate via concern somehow!
  # track history
  track_history     :on => [:title, :description]

  has_and_belongs_to_many :block_lists, class_name: 'Cms::BlockList', inverse_of: :blocks
  belongs_to :named_block, class_name: 'Cms::NamedBlock', inverse_of: :block

  def as_json(options={})
    super(:only => [:title,:summary, :content], :methods => :type)
  end
end
