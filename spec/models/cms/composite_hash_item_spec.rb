require 'rails_helper'

RSpec.describe Cms::CompositeHashItem, type: :model do

  let(:composite_hash_item) {FactoryGirl.create(:composite_hash_item)}

  it "should have valid composit_hash_item factory" do
    expect(composite_hash_item).to be_valid
  end

  it "should require a name" do
    composite_hash_item.name = nil
    expect(composite_hash_item).to be_invalid
  end


end