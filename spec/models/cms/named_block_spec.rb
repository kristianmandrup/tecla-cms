require 'rails_helper'

RSpec.describe Cms::NamedBlock, type: :model do

  let(:named_block) {FactoryGirl.create(:named_block)}
  let(:block) {FactoryGirl.create(:block)}
  
  it "should have valid block factory" do
    expect(named_block).to be_valid
  end

  it "should require a name" do
    named_block.name = nil
    expect(named_block).to be_invalid
  end

end

