module ContentItem
  extend ActiveSupport::Concern

  included do
    include_concerns :uniquely_named, :metadata,
                     :translatable, :validatable,
                     :renderable, :publishable,
                     :blueprintable, :serializable


   tracks :all
  end
end

