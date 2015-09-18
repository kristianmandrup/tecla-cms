module Document
  extend ActiveSupport::Concern

  included do
    include Mongoid::Document
    include Mongoid::Timestamps
    include Mongoid::History::Trackable
    include Concerned

    def type
      self.class.name.gsub('Cms::', '')
    end

    def has_field? name
      self.class.has_field? name
    end
  end

  class_methods do

    # ============
    # IMPORTANT
    # ============
    # This should be used to apply concerns for each Model
    # This way, models can be configured in large part directly via models.yml file,
    # Totally declaratively... and concerns list can be reused in various contexts and provide
    # much better overview and understanding of what each model can do and provides
    def apply_concerns model
      include_concerns ConcernsLoader.instance.load(model || name)
    end

    def text_field name, opts = {}
      field name, {type: String}.merge(opts)
    end

    def has_field? name
      self.fields.keys.include? name.to_s
    end

    def tracks *fields
      track_history :on => fields
    end
  end
end
