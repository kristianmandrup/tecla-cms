module API
  module V1
    module DefaultHelpers
      def valid_token?
        token_validator.valid_token?
      end

      def set_locale
        I18n.locale = params[API::V1.local_param_name] || I18n.default_locale
      end

      def invalid_token
        { json: { message: 'Invalid Token' } }
      end

      def authenticate!
        error!(invalid_token, 401) unless current_api_user
      end

      def current_api_user
        valid_token? and token_validator.entity
      end

      def current_ability
        @current_ability ||= Ability.new(current_api_user)
      end

      def load_and_authorize(action, model)
        current_ability.can? action, model
      end

      def token_validator
        @token_validator ||= begin
          token = headers[API::V1.token_header_name]
          JsonTokenAuthentication::Validator.new(token)
        end
      end
    end
  end
end
