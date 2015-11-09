module Api
  module V1
    class Layouts < Grape::API

      version 'v1'
      format :json
      helpers do
        def layout_params
          ActionController::Parameters.new(params).permit(:type, :language, :presenter, :description, :categories => [], :tags => [], :templete => [])
        end
      end
      resource :layouts do
        desc "Return list of all layout"
        get do
          Cms::Models::Template.all
        end

        desc "show a layout"
        params do
          requires :id, type: String
        end
        get ':id' do
          Cms::Models::Template.find(params[:id])
        end
        
        before do
          valid_token?
        end

        desc "create a new layout"
        params do
          requires :type, type: String
        end
        post  do
          if load_and_authorize(current_api_user, :create, Cms::Models::Template) 
            layout = Cms::Models::Template.new(layout_params)
            layout.submit!
            layout.save!
            {:success => true, :message => "Layout has been created!"}
          else
            {error_message: 'Access denied, you are not authorize to create Layout'}
          end
        end
        
        desc "update a layout"
        params do
          requires :id, type: String
          requires :title, type: String
        end
        put ':id' do
          if load_and_authorize(current_api_user, :update, Cms::Models::Template)
            Cms::Models::Template.find(params[:id]).update(layout_params)
            {:success => true, :message => "layout has been updated!"}
          else
            {error_message: 'Access denied, you are not authorize to edit layout'}
          end
        end
        
        desc "delete a layout"
        params do
          requires :id, type: String
        end
        delete ':id' do
          if load_and_authorize(current_api_user, :destroy, Cms::Models::Template)
            Cms::Models::Template.find(params[:id]).destroy!
          else
            {error_message: 'Access denied, you are not authorize to delete layout'}
          end
        end
        
        desc "submit for review"
        params do
          requires :id, type: String
        end
        get ':id/review' do
          if load_and_authorize(current_api_user, :stage, Cms::Models::Template)
            layout = Cms::Models::Template.find(params[:id])
            layout.review!
            layout.save!
            {:success => true, :message => "Layout has been submitted for review."}
          else
            {error_message: 'Access denied, you are not authorize to complete this action'}
          end
        end
       
        
        desc "publish a Layout"
        params do
          requires :id, type: String
        end
        get ':id/approve' do
          if load_and_authorize(current_api_user, :accept, Cms::Models::Template)
            layout = Cms::Models::Template.find(params[:id])
            layout.accept!
            layout.save!
            {:success => true, :message => "Layout has been published."}
          else
            {error_message: 'Access denied, you are not authorize to complete this action'}
          end
        end
        
        desc "reject a layout"
        params do
          requires :id, type: String
        end
        get ':id/reject' do
          if load_and_authorize(current_api_user, :reject, Cms::Models::Template)
            layout = Cms::Models::Template.find(params[:id])
            layout.reject!
            layout.save!
            {:success => true, :message => "Layout has been rejected."}
          else
            {error_message: 'Access denied, you are not authorize to complete this action'}
          end
        end
        
      end
    end
  end
end
