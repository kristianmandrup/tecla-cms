class Cms::Block < Cms::Document
  include_concerns :content_item,
                   :listable #, :extendable
                   # :images
                    #, ,
                  #  , :images, :templates
                  # FIX!!! ,
  # blueprint 'Cms::Block'
  blueprint!

  # belongs_to :block_lists, class_name: 'Cms::BlockList', inverse_of: :blocks
  # belongs_to :named_block, class_name: 'Cms::NamedBlock', inverse_of: :block
end


