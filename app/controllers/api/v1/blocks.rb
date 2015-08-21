module Api
  module V1
    class Blocks < Grape::API
      version 'v1'
      format :json

      resource :blocks do
        
        desc "Return list of all blocks"
        get do
          Cms::Block.all
        end
        
        desc "create a new block"
        params do
          requires :title, type: String
        end
        post do
          Cms::Block.create!({
            title: params[:title],
            prototype: params[:prototype],
            categories: params[:categories],
            tags: params[:tags],
            template: params[:template],
            summary: params[:summary],
            content: params[:content],
            description: params[:description]
          })
        end
        
        desc "show a block"
        params do
          requires :id, type: String
        end
        get ':id' do
          Cms::Block.find(params[:id])
        end
        
        desc "update a block"
        params do
          requires :id, type: String
          requires :title, type: String
        end
        put ':id' do
          Cms::Block.find(params[:id]).update({
            title: params[:title],
            prototype: params[:prototype],
            categories: params[:categories],
            tags: params[:tags],
            template: params[:template],
            summary: params[:summary],
            content: params[:content],
            description: params[:description]
          
          })
        end
        
        desc "delete a block"
        params do
          requires :id, type: String
        end
        delete ':id' do
          Cms::Block.find(params[:id]).destroy!
        end
      end
    end
  end
end
