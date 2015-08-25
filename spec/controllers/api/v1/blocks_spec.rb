require 'rails_helper'
require 'spec_helper'

describe Api::V1::Blocks, type: :request do
  #routes { TeclaCms::Engine.routes }

  describe 'GET /api/v1/hello' do
    it 'says hello to the world' do
      get :index
      last_response.status.should == 200
      #JSON.parse(last_response.body)["hello"].should == "world"
    end
  end

end
