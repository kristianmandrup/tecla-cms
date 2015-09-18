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

    def has_field? name
      self.class.has_field? name
    end
  end

  class_methods do
    def text_field name, opts = {}
      field name, {type: String}.merge opts
    end

    def has_field? name
      self.fields.keys.include? name.to_s
    end

    def tracks *fields
      track_history :on => fields
    end
  end
end
