module Api  
  module V1
    class Root < Grape::API

    helpers do
      def set_locale
          I18n.locale = params[:locale]  || I18n.default_locale
      end
      # Return invalid token json
      def invalid_token
        {json: {:message => "Invalid Tokens"}}
      end

      # Check if token is valid
      def valid_token?
        token_validator = Token::Validator.new(headers["Token"])
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

    before do
      set_locale
    end

      mount Api::V1::Blocks
      mount Api::V1::Lists
      mount Api::V1::Pages
      mount Api::V1::Images
      mount Api::V1::Layouts

    end
  end
end
