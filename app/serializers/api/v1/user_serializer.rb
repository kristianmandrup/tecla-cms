module API
  module V1
    class UserSerializer < BaseSerializer
      attributes :name, :email

      has_many :roles, serializer: API::V1::RoleSerializer
    end
  end
end
