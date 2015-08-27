module Api  
  module V1
    class Root < Grape::API

    helpers do
      # Return invalid token json
      def invalid_token
        {json: {:message => "Invalid Tokens"}}
      end

      # Check if token is valid
      def valid_token?
        token_validator = TokenValidator.new(headers["Token"])
        return token_validator.valid_jwt_token?
      end

      #current_user
      def current_api_user
        if valid_token?
          user = TokenValidator.new(headers['Token']).user 
        end
        user
      end

      #check authorization
      def load_and_authorize(user, action, model)
        user_ability = ::Ability.new(user)
        user_ability.can? action, model
      end
    end
      mount Api::V1::Blocks
      mount Api::V1::Lists
      mount Api::V1::Pages
    end
  end
end
