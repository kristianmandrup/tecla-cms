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

        desc "show a block"
        params do
          requires :id, type: String
        end
        get ':id' do
          Cms::Block.find(params[:id])
        end
        
        before do
          valid_token?
        end

        desc "create a new block"
        params do
          requires :title, type: String
        end
        post  do
          if load_and_authorize(current_api_user, :create, Cms::Block) 
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
            {:success => true, :message => "Block has been created!"}
          else
            {error_message: 'Access denied, you are not authorize to create block'}
          end
        end
        
        desc "update a block"
        params do
          requires :id, type: String
          requires :title, type: String
        end
        put ':id' do
          if load_and_authorize(current_api_user, :update, Cms::Block)
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
            {:success => true, :message => "Block has been updated!"}
          else
            {error_message: 'Access denied, you are not authorize to edit block'}
          end
        end
        
        desc "delete a block"
        params do
          requires :id, type: String
        end
        delete ':id' do
          if load_and_authorize(current_api_user, :destroy, Cms::Block)
            Cms::Block.find(params[:id]).destroy!
          else
            {error_message: 'Access denied, you are not authorize to delete block'}
          end
        end
      end
    end
  end
end
