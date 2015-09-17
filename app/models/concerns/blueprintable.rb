module Extensible
  extend ActiveSupport::Concern

  class_methods do
    def blueprint class_name
      class_eval do
        # http://stackoverflow.com/questions/6535898/mongodb-mongoid-self-reference-relationship
        belongs_to :prototype, class_name: class_name, :inverse_of => :blueprints
        has_many :blueprints, class_name: class_name, :inverse_of => :prototype
      end
    end
  end
end
