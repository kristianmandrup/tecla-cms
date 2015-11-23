require 'rails_helper'

describe API::V1::MenuItemSerializer, type: :serializer do
  let(:menu_item) { FactoryGirl.create(:menu_item) }
  let(:serializer) { API::V1::MenuItemSerializer.new(menu_item, root: false) }
  let(:response) { serializer.as_json }

  it 'returns icon, link, label, and type' do
    expect(response).to eq({
      icon: menu_item.icon,
      link: menu_item.link_translations[:en],
      label: menu_item.label_translations[:en],
      type: menu_item.type
    })
  end
end
