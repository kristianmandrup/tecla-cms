require 'rails_helper'

RSpec.describe Cms::CompositeItem, type: :model do

  let(:composite_item) {FactoryGirl.create(:composite_item)}

  it "should have valid composit_item factory" do
    expect(composite_item).to be_valid
  end

  it "should require a name" do
    composite_item.name = nil
    expect(composite_item).to be_invalid
  end

  it "should have trackable history and counts" do
    user = FactoryGirl.create(:user)
    composite_item_name1 = Faker::Name.name
    composite_item_name2 = Faker::Name.name
    composite_item.update(name: composite_item_name1, modifier: user)
    composite_item.update(name: composite_item_name2, modifier: user)
    expect(composite_item.name).to eq(composite_item_name2)
    expect(composite_item.history_tracks.count).to eq(2)
    composite_item.undo! user
    expect(composite_item.name).to eq(composite_item_name1)
  end 

  it "should have orderable" do
    composite_item
    composite_item1 = FactoryGirl.create(:composite_item)
    composite_item2 = FactoryGirl.create(:composite_item)
    composite_item2.move_to! 1
    expect(composite_item2.position).to eq(1)
  end
end