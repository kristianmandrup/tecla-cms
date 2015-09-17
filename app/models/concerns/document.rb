module Document
  extend ActiveSupport::Concern

  included do
    include Mongoid::Document
    include Mongoid::Timestamps
    include Mongoid::History::Trackable
    include Named

    def type
      self.class.name.gsub('Cms::', '')
    end

    def as_json(options={})
      super(:only => json_fields, :methods => :type)
    end
  end

  class_methods do
    def tracks *fields
      track_history :on => fields
    end
  end
end
