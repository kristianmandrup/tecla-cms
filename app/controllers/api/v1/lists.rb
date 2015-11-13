module API
  module V1
    class Lists < Grape::API
      version 'v1'
      format :json

      helpers do
        def get_class_name(type)
          if type.blank? || type == "list"
            "Cms::List"
          else
            "Cms::#{type.capitalize}List"
          end.constantize

        end

        def skip_null
          (params[:skipnull] == "true")
        end

        def list_params
          if get_class_name(params[:type]) == Cms::List
            ActionController::Parameters.new(params).permit(:name, :root, :child_type, :label, :tags => [], :name_translations => I18n.available_locales)
          else
            ActionController::Parameters.new(params).permit(:name, :name_translations => I18n.available_locales)
          end
        end
      end

      resource :lists do

        desc "Return all lists"
        get do
          get_class_name(params[:type]).get_all_lists(skip_null)
        end

        desc "show a list"
        params do
          requires :id, type: String
        end
        get ':id' do
          list = get_class_name(params[:type]).get_list_by_name(params[:id])
          if skip_null
            {list.name => list.set_hash}.compact
          else
            {list.name => list.set_hash}
          end
        end

        before do
          valid_token?
        end
        desc "create a new list"
        params do
          #requires :name, type: String
        end
        post do
          if load_and_authorize(:create, Cms::List)
            get_class_name(params[:type]).create!(list_params)
            {:success => true, :message => "list has been created!"}
          else
            {error_message: 'Access denied, you are not authorize to create list'}
          end
        end

        desc "update a list"
        params do
          requires :id, type: String
          #requires :name, type: String
        end
        put ':id' do
          if load_and_authorize(:update, Cms::List)
            get_class_name(params[:type]).find(params[:id]).update((list_params))
            {:success => true, :message => "list has been updated!"}
          else
            {error_message: 'Access denied, you are not authorize to update list'}
          end
        end

        desc "delete a list"
        params do
          requires :id, type: String
        end
        delete ':id' do
          if load_and_authorize(:destroy, Cms::List)
            Cms::List.find(params[:id]).destroy!
            {:success => true, :message => "list has been deleted!"}
          else
            {error_message: 'Access denied, you are not authorize to delete list'}
          end
        end
      end
    end
  end
end
