class Cms::Block
  include Concerned
  include_concerns :document, :uniquely_named, :translatable, :validatable,
                   :blueprintable, :publishable,
                   :metadata, :renderable,
                   :listable #, :extendable
                   # :images
                    #, ,
                  #  , :images, :templates
                  # FIX!!! ,

  localize_fields :title, :summary, :content, :description
  fields_validation
  # tracks :title, :description
  # blueprint 'Cms::Block'

  # has_and_belongs_to_many :block_lists, class_name: 'Cms::BlockList', inverse_of: :blocks
  # belongs_to :named_block, class_name: 'Cms::NamedBlock', inverse_of: :block

  def json_fields
    [:title, :summary, :content]
  end
end
