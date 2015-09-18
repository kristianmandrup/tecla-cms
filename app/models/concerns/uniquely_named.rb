module Named
  extend ActiveSupport::Concern

  included do
    # name is an identifier, used by REST API
    field :name, type: String

    # must be unique and always present!
    # should have more validation, such as alpha-numeric check
    validates :name, presence: true, uniqueness: true
  end
end