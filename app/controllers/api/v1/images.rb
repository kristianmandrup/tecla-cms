module Api
  module V1
    class Images < Grape::API
      version 'v1'
      format :json
      helpers do
        def image_params
          ActionController::Parameters.new(params).permit(:title, :type, :content, :categories => [], :tags => [], :title_translations => I18n.available_locales)
        end
      end
      resource :images  do
        desc "Return list of all images"
        get do
          Cms::Models::Image.all
        end

        desc "show a image"
        params do
          requires :id, type: String
        end
        get ':id' do
          Cms::Models::Image.find(params[:id])
        end

        before do
          valid_token?
        end

        desc "create a new image"
        params do
          #requires :title, type: String
          #TODO requires :content, type: String
        end
        post  do
          if load_and_authorize(:create, Cms::Models::Image)
            image = Cms::Models::Image.new(image_params)
            image.content = ActionDispatch::Http::UploadedFile.new(params[:content]) if params[:content]
            image.submit!
            image.save!
            {:success => true, :message => "Image has been created!"}
          else
            {error_message: 'Access denied, you are not authorize to create Image'}
          end
        end

        desc "update a image"
        params do
          requires :id, type: String
          #requires :title, type: String
        end
        put ':id' do
          if load_and_authorize(:update, Cms::Models::Image)
            Cms::Models::Image.find(params[:id]).update(image_params)
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
          if load_and_authorize(:destroy, Cms::Models::Image)
            Cms::Models::Image.find(params[:id]).destroy!
            {:success => true, :message => "image has been deleted!"}
          else
            {error_message: 'Access denied, you are not authorize to delete image'}
          end
        end

        desc "submit for review"
        params do
          requires :id, type: String
        end
        get ':id/review' do
          if load_and_authorize(:stage, Cms::Models::Image)
            image = Cms::Models::Image.find(params[:id])
            image.review!
            image.save!
            {:success => true, :message => "image has been submitted for review."}
          else
            {error_message: 'Access denied, you are not authorize to complete this action'}
          end
        end

        desc "publish a image"
        params do
          requires :id, type: String
        end
        get ':id/approve' do
          if load_and_authorize(:accept, Cms::Models::Image )
            block = Cms::Models::Image.find(params[:id])
            block.accept!
            block.save!
            {:success => true, :message => "Image has been published."}
          else
            {error_message: 'Access denied, you are not authorize to complete this action'}
          end
        end

        desc "reject a image"
        params do
          requires :id, type: String
        end
        get ':id/reject' do
          if load_and_authorize(:reject, Cms::Models::Image)
            block = Cms::Models::Image.find(params[:id])
            block.reject!
            block.save!
            {:success => true, :message => "Image has been rejected." }
          else
            {error_message: 'Access denied, you are not authorize to complete this action'}
          end
        end
      end
    end
  end
end
