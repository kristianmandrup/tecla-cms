module Named
  extend ActiveSupport::Concern

  included do
    # name is an identifier, used by REST API
    field :name, type: String

    # must be unique and always present!
    validates :name, presence: true, uniqueness: true
  end
end