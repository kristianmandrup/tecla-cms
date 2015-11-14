require 'rails_helper'

describe API::V1::UserSerializer, type: :serializer do
  let(:user) { FactoryGirl.create(:super_admin) }
  let(:serializer) { API::V1::UserSerializer.new(user, root: false) }
  let(:response) { serializer.as_json }

  it 'returns name, email & roles' do
    expect(response).to eq({
      name: user.name,
      email: user.email,
      roles: [{ name: 'super_admin' }]
    })
  end
end
