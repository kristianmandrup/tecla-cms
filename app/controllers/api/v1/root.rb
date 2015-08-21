module Api  
  module V1
    class Root < Grape::API
      mount Api::V1::Blocks
  
    end
  end
end
