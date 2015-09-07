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
  end
end