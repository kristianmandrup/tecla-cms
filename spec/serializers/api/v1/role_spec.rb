require 'rails_helper'

describe API::V1::RoleSerializer, type: :serializer do
  let(:role) { FactoryGirl.create(:role) }
  let(:serializer) { API::V1::RoleSerializer.new(role, root: false) }
  let(:response) { serializer.as_json }

  it 'returns name' do
    expect(response).to eq({
      name: role.name
    })
  end
end
