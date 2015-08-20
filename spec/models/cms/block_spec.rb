require 'rails_helper'

RSpec.describe Cms::Block, type: :model do

  let(:block) {FactoryGirl.create(:block)}
  
  it "should have valid block factory" do
    expect(block).to be_valid
  end

  it "should require a title" do
    block.title = nil
    expect(block).to be_invalid
  end

  it "should have trackable history and counts" do
    user = FactoryGirl.create(:user)
    block.update(title: "test title", modifier: user)
    block.update(title: "new test title")
    expect(block.title).to eq("new test title")
    expect(block.history_tracks.count).to eq(2)
    block.undo! user
    expect(block.title).to eq("test title")
  end 

  it "should have orderable" do
    block
    block1 = FactoryGirl.create(:block)
    block2 = FactoryGirl.create(:block)
    block2.move_to! 1
    expect(block2.position).to eq(1)
  end
end

