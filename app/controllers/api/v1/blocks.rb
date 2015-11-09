module Api
  module V1
    class Blocks < Grape::API

      version 'v1'
      format :json
      helpers do
        def block_params
          ActionController::Parameters.new(params).permit( :title, :prototype, :summary, :content, :description, :generic_attributes_attributes => [:name, :caption,:type, :filters, :input, :output,:value], :categories => [], :tags => [], :templete => [], :title_translations => I18n.available_locales )
        end
        
        def auto_translate?
          params[:auto_translate] == "true"
        end
      end
      resource :blocks do
        desc "Return list of all blocks"
        get do
          Cms::Models::Block.all
        end

        desc "show a block"
        params do
          requires :id, type: String
        end
        get ':id' do
          Cms::Models::Block.find(params[:id])
        end
        
        desc "render a block"
        params do
          requires :title, type: String
        end
        get 'render/:title' do
          block = Cms::Models::Block.find_by(:title => params[:title])
          render_layout = block.get_template(params[:template], params[:layout]) 
          {:status => 200, :template => render_layout}
        end
        
        before do
          valid_token?
        end

        desc "create a new block"
        params do
          #requires :title, type: String
        end
        post  do
          if load_and_authorize(current_api_user, :create, Cms::Models::Block) 
            block = Cms::Models::Block.new(block_params)
            block.submit!
            block.save!
            ::TranslationJob.new(block.id.to_s, "Cms::Block").enqueue(queue: :traslation) if auto_translate?
            {:success => true, :message => "Block has been created!"}
          else
            {error_message: 'Access denied, you are not authorize to create block'}
          end
        end
        
        desc "update a block"
        params do
          requires :id, type: String
          #requires :title, type: String
        end
        put ':id' do
          if load_and_authorize(current_api_user, :update, Cms::Models::Block)
            Cms::Models::Block.find(params[:id]).update(block_params)
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
          if load_and_authorize(current_api_user, :destroy, Cms::Models::Block)
            Cms::Models::Block.find(params[:id]).destroy!
          else
            {error_message: 'Access denied, you are not authorize to delete block'}
          end
        end
        
        desc "submit for review"
        params do
          requires :id, type: String
        end
        get ':id/review' do
          if load_and_authorize(current_api_user, :stage, Cms::Models::Block)
            block = Cms::Models::Block.find(params[:id])
            block.review!
            block.save!
            {:success => true, :message => "Block has been submitted for review."}
          else
            {error_message: 'Access denied, you are not authorize to complete this action'}
          end
        end
       
        
        desc "publish a block"
        params do
          requires :id, type: String
        end
        get ':id/approve' do
          if load_and_authorize(current_api_user, :accept, Cms::Models::Block)
            ::PublishJob.new(params[:id]).enqueue(wait_until: Time.now + 2.minutes) #TODO will pass future date once tested
            {:success => true, :message => "Block has been published."}
          else
            {error_message: 'Access denied, you are not authorize to complete this action'}
          end
        end
        
        desc "reject a block"
        params do
          requires :id, type: String
        end
        get ':id/reject' do
          if load_and_authorize(current_api_user, :reject, Cms::Models::Block)
            block = Cms::Models::Block.find(params[:id])
            block.reject!
            block.save!
            {:success => true, :message => "Block has been rejected."}
          else
            {error_message: 'Access denied, you are not authorize to complete this action'}
          end
        end
        
      end
    end
  end
end
