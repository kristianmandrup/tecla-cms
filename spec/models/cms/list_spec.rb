require 'rails_helper'

RSpec.describe Cms::List, type: :model do

  let(:list) {FactoryGirl.create(:list)}
  
  it "should have valid list factory" do
    expect(list).to be_valid
  end

  it "should require a title" do
    list.name = nil
    expect(list).to be_invalid
    #expect(article.errors.full_messages).to match_array(["Title can't be blank"])
  end  

  it "should have trackable history and counts" do
    user = FactoryGirl.create(:user)
    list_name1 = Faker::Name.name
    list_name2 = Faker::Name.name
    list.update(name: list_name1, modifier: user)
    list.update(name: list_name2, modifier: user)
    expect(list.name).to eq(list_name2)
    expect(list.history_tracks.count).to eq(2)
    list.undo! user
    expect(list.name).to eq(list_name1)
  end 

  it "should have orderable" do
    list
    list1 = FactoryGirl.create(:list)
    list2 = FactoryGirl.create(:list)
    list2.move_to! 1
    expect(list2.position).to eq(1)
  end
end
