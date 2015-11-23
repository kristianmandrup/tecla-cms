module Cms
  class User
    class Authorizer
      attr_reader :email, :password, :user

      def initialize(email, password)
        @email, @password = email, password
      end

      def authorize
        valid_auth? ? responder.valid_token : responder.invalid_token
      end

      def responder
        JsonTokenAuthentication::Responder.new(user)
      end

      def valid_auth?
        @user = Cms::User.authenticate(email, password)
        user.present?
      end
    end
  end
end
