module Api  
  module V1
    class Root < Grape::API
      mount Api::V1::Blocks
      mount Api::V1::Lists
  
    end
  end
end
