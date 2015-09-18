module Categorizable
  extend ActiveSupport::Concern

  included do
    include_concerns :document, :uniquely_named,
                     :translatable, :validatable,
                     :renderable, :publishable,
                     :blueprintable, :serializable

   tracks :all
  end
end

