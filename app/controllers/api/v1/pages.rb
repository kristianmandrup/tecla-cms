module Api
  module V1
    class Pages < Grape::API

      version 'v1'
      format :json
      
      resource :pages do
        desc "Return list of all pages"
        get do          
          pages = Cms::Page.all
          pages.map do |p|
            { p.name =>  p.nested_item }
          end
        end

        desc "show a page"
        params do
          requires :id, type: String
        end
        get ':id' do
          response = Cms::Page.find_by(:name => params[:id])
          response.nested_item
        end
        
        before do
          valid_token?
        end
        desc "create a new page"
        params do
          requires :name, type: String
        end
        post 'create' do
          page = Cms::Page.create!({
            name: params[:name],
          })
        { id: page.id.to_s, name: page.name, status: 200}
        end
        
        
        desc "update a page"
        params do
          requires :id, type: String
          requires :name, type: String
        end
        put ':id' do
            Cms::Page.find_by(:name => params[:id]).update({
              name: params[:name],
            })
            {:success => true, :message => "Page has been updated!"}
        end
        
        desc "delete a page"
        params do
          requires :id, type: String
        end
        delete ':id' do 
          Cms::Page.find(params[:id]).destroy!
        end
      end
    end
  end
end
