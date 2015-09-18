module Metadata
  extend ActiveSupport::Concern

  included do
    include_concerns :describable, :categorizable, :taggable
  end
end