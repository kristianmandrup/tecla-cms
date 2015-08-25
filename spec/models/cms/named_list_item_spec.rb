require 'rails_helper'

RSpec.describe Cms::NamedImage, type: :model do

  let(:named_list_item) {FactoryGirl.create(:named_list_item)}
  
  it "should have valid named image factory" do
    expect(named_list_item).to be_valid
  end

  it "should require a name" do
    named_list_item.name = nil
    expect(named_list_item).to be_invalid
  end

end

