module Templates
  extend ActiveSupport::Concern

  included do
    has_many :templates, class_name: 'Cms::Template', as: :templatable
  end
end
