module Categorizable
  extend ActiveSupport::Concern

  included do
    include_concerns :uniquely_named,
                     :translatable, :validatable,
                     :renderable, :publishable,
                     :blueprintable, :serializable

   tracks :all
  end
end

