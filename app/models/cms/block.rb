class Cms::Block
  include Concerned
  include_concerns :document, :translatable, :validatable,
                   :blueprintable, :publishable #,
                   # :listable
                    #, :taggable, :extendable
                  #  , :images, :templates
                  # FIX!!! , :renderable

  localize_fields :title, :summary, :content #, :description
  validate_fields!
  # tracks :title, :description
  # blueprint 'Cms::Block'

  # has_and_belongs_to_many :block_lists, class_name: 'Cms::BlockList', inverse_of: :blocks
  # belongs_to :named_block, class_name: 'Cms::NamedBlock', inverse_of: :block

  def json_fields
    [:title, :summary, :content]
  end
end
