module Composite
  extend ActiveSupport::Concern

  included do
    include_concerns :listable

    def type
      self.class.name.gsub("Cms::", "")
    end
  end

  class_methods do
    def get_all_lists(skip_null)
      self.all.inject([]) do |res, list|
        res << hash_for(list, skip_null)
        res
      end
    end

    def hash_for list, skip_null
      hash = {list.name => list.set_hash}
      skip_null ? hash.compact : hash
    end

    def self.get_list_by_name(name)
      find_by(:name => name)
    end
  end
end
