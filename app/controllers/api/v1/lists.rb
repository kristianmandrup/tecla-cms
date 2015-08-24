module Api
  module V1
    class Lists < Grape::API
      version 'v1'
      format :json

      resource :lists do
        
        desc "Return all lists"
        get do
          Cms::List.all
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
        
        desc "show a list"
        params do
          requires :id, type: String
        end
        get ':id' do
          Cms::List.find(params[:id])
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
