require_dependency File.expand_path('../../../../lib/user/authorizer', __dir__)

module API
  module V1
    class Auth < Grape::API
      version 'v1'
      format :json

      resource :auth do

        desc "User registration"
        params do
          requires :email, regexp: /.+@.+/
          requires :password
        end
        post 'sign_up' do
          user = Cms::User.new({
            email: params[:email],
            password: params[:password]
          })
          user.save!
          {status: 'ok', :message => "you have sucessfully registerd" }
        end


        desc "User login"
        params do
          requires :email, regexp: /.+@.+/
          requires :password
        end
        post  '/login' do
          {
            status: 'ok',
            response: Cms::User::Authorizer.new(params[:email], params[:password]).authorize
          }
        end
      end
    end
  end
end
