module API
  module V1
    module DefaultOptions
      extend ActiveSupport::Concern

      included do
        version 'v1'
        format :json
        formatter :json, Grape::Formatter::ActiveModelSerializers
      end
    end
  end
end
