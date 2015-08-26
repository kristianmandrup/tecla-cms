module Api
  module V1
    class Lists < Grape::API
      version 'v1'
      format :json
      
      helpers do
        def get_class_name(type)
          case type
          when "hash"
            return Cms::HashList
          when "block"
            return Cms::BlockList
          when "image"
            return Cms::ImageList
          else
            return Cms::List
          end
        end
      end

      resource :lists do
        
        desc "Return all lists"
         params do
          requires :type, type: String
        end
        get do
          @lists = get_class_name(params[:type]).all
          #TODO: will define the below code in model
          list_array = []
          @lists.each do |list|
            list_array << {list.name => list.set_hash}
          end
          list_array
        end
        
        desc "show a list"
        params do
          requires :id, type: String
          requires :type, type: String
        end
        get ':id' do
          @list = get_class_name(params[:type]).find_by(:name => params[:id])
          {@list.name => @list.set_hash}
        end
        
        desc "create a new list"
        before do
          valid_token?
        end
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
        before do
          valid_token?
        end
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
        before do
          valid_token?
        end
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
