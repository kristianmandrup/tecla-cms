require 'rails_helper'

RSpec.describe Cms::NamedImage, type: :model do

  let(:named_image) {FactoryGirl.create(:named_image)}
  
  it "should have valid named image factory" do
    expect(named_image).to be_valid
  end

  it "should require a name" do
    named_image.name = nil
    expect(named_image).to be_invalid
  end

end

