module Api
  module V1
    class Blocks < Grape::API
      version 'v1'
      format :json

      resource :blocks do
        desc "Return list of all blocks"
        get do
          Cms::Block.all
        end
      end
    end
  end
end
