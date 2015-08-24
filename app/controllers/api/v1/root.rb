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
    end
      mount Api::V1::Blocks
      mount Api::V1::Lists
      mount Api::V1::Images
    end
  end
end
