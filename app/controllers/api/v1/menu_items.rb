module API
  module V1
    class MenuItems < Grape::API
      include API::V1::DefaultOptions
      include API::V1::DefaultResources

      resources_for(serializer: API::V1::MenuItemSerializer,
        model_klass: Cms::Models::Menu::Item)

      helpers do
        private
          def permitted_params
            ActionController::Parameters.new(params)
            .permit(:icon, :position, :label, :link, label: I18n.available_locales,
              link: I18n.available_locales)
          end
      end
    end
  end
end
