module Api
  module V1
    class Images < Grape::API

      version 'v1'
      format :json
      
      resource :images  do
        desc "Return list of all images"
        get do
          Cms::Image.all
        end

        desc "show a image"
        params do
          requires :id, type: String
        end
        get ':id' do
          Cms::Image.find(params[:id])
        end
        
        before do
          valid_token?
        end

        desc "create a new image"
        params do
          requires :title, type: String
        end
        post  do
          if load_and_authorize(current_api_user, :create, Cms::Image) 
            Cms::Image.create!({
              title: params[:title],
              type: params[:type],
              categories: params[:categories],
              tags: params[:tags],
              description: params[:description],
              content: params[:content]
            })
            {:success => true, :message => "Image has been created!"}
          else
            {error_message: 'Access denied, you are not authorize to create Image'}
          end
        end
        
        desc "update a image"
        params do
          requires :id, type: String
          requires :title, type: String
        end
        put ':id' do
          if load_and_authorize(current_api_user, :update, Cms::Image)
            Cms::Image.find(params[:id]).update({
              title: params[:title],
              type: params[:type],
              categories: params[:categories],
              tags: params[:tags],
              description: params[:description],
              content: params[:content]
            })
            {:success => true, :message => "image has been updated!"}
          else
            {error_message: 'Access denied, you are not authorize to edit image'}
          end
        end
        
        desc "delete a image"
        params do
          requires :id, type: String
        end
        delete ':id' do
          if load_and_authorize(current_api_user, :destroy, Cms::Image)
            Cms::Image.find(params[:id]).destroy!
            {:success => true, :message => "image has been deleted!"}
          else
            {error_message: 'Access denied, you are not authorize to delete image'}
          end
        end
      end
    end
  end
end
