module Api
  module V1
    class Lists < Grape::API
      version 'v1'
      format :json
      
      helpers do
        def get_class_name(type)
          return "Cms::List".constantize if (type.blank? || type == "list") 
          return "Cms::#{type.capitalize}List".constantize
        end
      end

      resource :lists do
        
        desc "Return all lists"
        get do
          get_class_name(params[:type]).get_all_lists
        end
        
        desc "show a list"
        params do
          requires :id, type: String
        end
        get ':id' do
          list = get_class_name(params[:type]).get_list_by_name(params[:id])
          {list.name => list.set_hash}
        end
        
        before do
          valid_token?
        end
        desc "create a new list"
        params do
          requires :name, type: String
        end
        post do
          Cms::List.create!({
            name: params[:name],
            root: params[:root],
            child_type: params[:child_type],
            tags: params[:tags],
            label: params[:label]
          })
        end
        
        desc "update a list"
        params do
          requires :id, type: String
          requires :name, type: String
        end
        put ':id' do
          Cms::List.find(params[:id]).update({
            name: params[:name],
            root: params[:root],
            child_type: params[:child_type],
            tags: params[:tags],
            label: params[:label]
          })
        end
        
        desc "delete a list"
        params do
          requires :id, type: String
        end
        delete ':id' do
          Cms::List.find(params[:id]).destroy!
        end
      end
    end
  end
end
