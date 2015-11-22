module Document
  extend ActiveSupport::Concern

  included do
    include Mongoid::Document
    include Mongoid::Timestamps
    include Mongoid::History::Trackable

    def type
      self.class.name.gsub('Cms::', '')
    end
  end
end
