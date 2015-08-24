module Api 
  class Root < Grape::API
    prefix 'api'
    format :json
    
    rescue_from :all, :backtrace => true
    error_formatter :json, API::ErrorFormatter
    
    mount Api::V1::Auth
    mount Api::V1::Root
  end
end
