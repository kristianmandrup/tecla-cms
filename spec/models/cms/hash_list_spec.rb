require 'rails_helper'

RSpec.describe Cms::HashList, type: :model do

  let(:hash_list) {FactoryGirl.create(:hash_list)}

  it "should have valid hash_list factory" do
    expect(hash_list).to be_valid
  end

  it "should require a name" do
    hash_list.name = nil
    expect(hash_list).to be_invalid
  end

  it "should be set hash value" do
    composit_hash = FactoryGirl.create(:hash_list)
    expect(composit_hash.set_hash).to include{{'type' => 'HashList'}}

    hash_lists =  FactoryGirl.create(:hash_list)
    hash_list = FactoryGirl.create(:hash_list, composite_hash: hash_lists)
    named_block = FactoryGirl.create(:named_block, composite_hash: hash_lists)
    block = FactoryGirl.create(:block_list, composite_hash: hash_lists)
    image = FactoryGirl.create(:image_list, composite_hash: hash_lists)
    
    response = hash_lists.set_hash

    expect(response[hash_list.name]).to include{{'type' => 'HashList'} }

    expect(response[named_block.name]).to include{{'type' => 'NamedBlock'} }

    expect(response[block.name]).to include{{'type' => 'BlockList'} }

    expect(response[hash_list.name]).to include{{'type' => 'ImageList'} }
    
  end
end