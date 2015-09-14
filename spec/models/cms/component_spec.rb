require 'rails_helper'

RSpec.describe Cms::Component, type: :model do

  let(:component) {FactoryGirl.create(:component)}

  it "should have valid component factory" do
    expect(component).to be_valid
  end

  it "should require a name" do
    component.name = nil
    expect(component).to be_invalid
  end

  it "should be set hash value" do
    composit_hash = FactoryGirl.create(:component)
    
    expect(composit_hash.set_hash["type"]).to eq("Component")

    hash_lists =  FactoryGirl.create(:component)
    hash_list = FactoryGirl.create(:component, composite_hash: hash_lists)
    named_block = FactoryGirl.create(:named_block, composite_hash: hash_lists)
    block = FactoryGirl.create(:block_list, composite_hash: hash_lists)
    image = FactoryGirl.create(:image_list, composite_hash: hash_lists)
    
    response = hash_lists.set_hash
    expect(response[hash_list.name]["type"]).to eq("Component")
    expect(response[named_block.name]["type"]).to eq("NamedBlock")
    expect(response[block.name]["type"]).to eq("BlockList")
    expect(response[image.name]["type"]).to eq("ImageList")
  end
end
