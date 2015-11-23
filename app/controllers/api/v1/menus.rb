module API
  module V1
    class Menus < Grape::API
      include API::V1::DefaultOptions
      include API::V1::DefaultResources

      resources_for(serializer: API::V1::MenuSerializer, model_klass: Cms::Models::Menu)

      helpers do
        private
          def permitted_params
            ActionController::Parameters.new(params)
            .permit(:name, :position)
          end

          def find_list
            model_klass.root
          end
      end
    end
  end
end
