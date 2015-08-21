module Api 
  class Root < Grape::API
    prefix 'api'
    format :json
    
    mount Api::V1::Root
    # mount API::V2::Root (next version)
  end
end
