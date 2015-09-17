module Uploadable
  extend ActiveSupport::Concern

  included do
    field :img_content, type: String
    mount_uploader :img_content, ImageUploader
    process_in_background :img_content
    validates :img_content, presence: true
  end
end