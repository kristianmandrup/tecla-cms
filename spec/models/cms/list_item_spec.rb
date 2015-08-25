require 'rails_helper'

RSpec.describe Cms::ListItem, type: :model do

  let(:list_item) {FactoryGirl.create(:list_item)}
  
  it "should have valid list_item factory" do
    expect(list_item).to be_valid
  end

  it "should require a label" do
    list_item.name = nil
    expect(list_item).to be_invalid
  end  


  it "should have trackable history and counts" do
    user = FactoryGirl.create(:user)
    list_item.update(label: "test label", modifier: user)
    list_item.update(label: "new test label")
    expect(list_item.label).to eq("new test label")
    expect(list_item.history_tracks.count).to eq(2)
    list_item.undo! user
    expect(list_item.label).to eq("test label")
  end 

  it "should have orderable" do
    list_item
    list_item1 = FactoryGirl.create(:list_item)
    list_item2 = FactoryGirl.create(:list_item)
    list_item2.move_to! 1
    expect(list_item2.position).to eq(1)
  end
end
