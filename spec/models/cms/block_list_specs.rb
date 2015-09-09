require 'rails_helper'

RSpec.describe Cms::BlockList, type: :model do

  let(:block_list) {FactoryGirl.create(:block_list)}

  it "should have valid page factory" do
    expect(block_list).to be_valid
  end

  it "should have hash format value" do
    
    block = FactoryGirl.create(:block)
    block_list = FactoryGirl.create(:block_list, blocks: [block])
    response = block_list.set_hash
    expect(response[0]).to include{{'type' => 'Block'}}

  end

end