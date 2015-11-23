module API
  module V1
    class Users < Grape::API
      include API::V1::DefaultOptions
      include API::V1::DefaultResources

      resources_for(serializer: API::V1::UserSerializer, model_klass: Cms::User)

      helpers do
        private
          def permitted_params
            ActionController::Parameters.new(params)
            .permit(:name, :email, :password, :password_confirmation)
          end
      end
    end
  end
end
