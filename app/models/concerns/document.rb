module Cms::Document
  extend ActiveSupport::Concern

  included do
    include Mongoid::Document
    include Mongoid::Timestamps
    include Mongoid::History::Trackable
    include Mongoid::Orderable
  end
end
