module Blueprintable
  extend ActiveSupport::Concern
  
  included do

    after_save do
      ProtoTypeBuilder.new(self.prototype).build self if prototype_id_changed?
    end

  end

  class_methods do
    def blueprint class_name=nil
      class_name ||= name
      class_eval do
        # http://stackoverflow.com/questions/6535898/mongodb-mongoid-self-reference-relationship
        belongs_to :prototype, class_name: class_name, :inverse_of => :blueprints
        has_many :blueprints, class_name: class_name, :inverse_of => :prototype
      end
    end
    alias_method :blueprint!, :blueprint
  end
end
