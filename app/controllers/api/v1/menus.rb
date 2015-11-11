module Api
  module V1
    class Menus < Grape::API
      version 'v1'
      format :json

      helpers do
        private
          def load_resource!
            @resource = Cms::Models::Menu.find_by(id: params[:id])
            unless @resource
              error!({ message: 'Not Found' }, 404)
            end
          end

          def authorize_resource!(action)
            if current_ability.cannot? action, Cms::Models::Menu
              error!({ message: 'Unauthorized' }, 401)
            end
          end

          def update_resource
            authorize_resource!(:update)
            if @resource.update(menu_params)
              { status: 200, message: 'menu updated successfully' }
            else
              { status: 422, errors: @resource.errors }
            end
          end

          def menu_params
            ActionController::Parameters.new(params)
            .permit(:name, :position, name_translations: I18n.available_locales)
          end
      end

      resource :menus do
        desc 'Return all menus'
        get do
          Cms::Models::Menu.set_hash
        end

        desc 'create a new menu'
        post do
          authenticate!
          authorize_resource!(:create)
          menu = Cms::Models::Menu.new(menu_params)
          if menu.save
            { status: 201, message: 'menu created successfully' }
          else
            { status: 422, errors: menu.errors }
          end
        end

        params do
          requires :id, type: String
        end

        route_param :id do
          before { load_resource! }

          desc 'show a menu'
          get do
            @resource.set_hash
          end

          before { authenticate! }

          desc 'update a menu'
          put do
            update_resource
          end

          desc 'update a menu'
          post do
            update_resource
          end

          desc 'delete a menu'
          delete do
            authorize_resource!(:destroy)
            if @resource.destroy
              { status: 200, message: 'menu deleted successfully' }
            else
              { status: 422, errors: @resource.errors }
            end
          end
        end
      end
    end
  end
end
