require 'rails_helper'

describe API::V1::MenuSerializer, type: :serializer do
  let(:menu) { FactoryGirl.create(:menu) }
  let!(:submenu) do
    submenu = FactoryGirl.create(:menu)
    menu.add_item(submenu)
    submenu
  end
  let(:menu_item) do
    menu_item = FactoryGirl.create(:menu_item)
    menu.add_item(menu_item)
    menu_item
  end
  let!(:menu_item_response) do
    JSON.parse(API::V1::MenuItemSerializer.new(menu_item, root: false).to_json)
  end
  let(:serializer) { API::V1::MenuSerializer.new(menu, root: false) }
  let(:response) { JSON.parse(serializer.to_json) }

  it 'returns type, name, menus' do
    expect(response).to eq({
      'type' => menu.type,
      'name' => menu.name,
      'menus' => {
        'items' => [menu_item_response],
        'menus' => {
          submenu.name => {
            'type' => submenu.type,
            'name' => submenu.name,
            'menus' => {
              'items' => [],
              'menus' => {}
            }
          }
        }
      }
    })
  end
end
