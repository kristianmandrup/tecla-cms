module Api
  module V1
    class Root < Grape::API

      helpers do
        extend Forwardable
        def_delegator :token_validator, :valid_token?

        def set_locale
          I18n.locale = params[:locale] || I18n.default_locale
        end
        # Return invalid token json
        def invalid_token
          { json: { message: 'Invalid Tokens' } }
        end

        #current_user
        def current_api_user
          valid_token? and token_validator.entity
        end

        #check authorization
        def load_and_authorize(user, action, model)
          user_ability = ::Ability.new(user)
          user_ability.can? action, model
        end

        def token_validator
          @token_validator ||= JsonTokenAuthentication::Validator.new(headers[token_header_name])
        end

        def token_header_name
          'Token'
        end
      end

      before { set_locale }

      mount Api::V1::Blocks
      mount Api::V1::Lists
      mount Api::V1::Pages
      mount Api::V1::Images
      mount Api::V1::Layouts
    end
  end
end
