module Cms::Document

  def self.included(clazz)
    clazz.include Mongoid::Document
    clazz.include Mongoid::Timestamps
    clazz.include Mongoid::History::Trackable
    clazz.include Mongoid::Orderable
  end

end
