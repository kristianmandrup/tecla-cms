class Cms::Block
  include Concerned
  include_concerns :document, :named, :publishable,
                   :listable, :renderable, :translatable,
                   :describable, :taggable, :extendable,
                   :blueprintable, :images, :templates

  track :title, :description
  localize_fields :title, :summary, :content

  blueprint 'Cms::Block'

  has_and_belongs_to_many :block_lists, class_name: 'Cms::BlockList', inverse_of: :blocks
  belongs_to :named_block, class_name: 'Cms::NamedBlock', inverse_of: :block

  def json_fields
    [:title,:summary, :content]
  end
end
