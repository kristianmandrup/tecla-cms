module Api
  module V1
    class Menus < Grape::API
      include Api::V1::DefaultOptions
      include Api::V1::DefaultResources

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
