module API
  class Root < Grape::API
    prefix 'api'
    format :json

    #rescue_from :all, :backtrace => true
    #error_formatter :json, API::ErrorFormatter

    mount API::V1::Auth
    mount API::V1::Root
  end
end
