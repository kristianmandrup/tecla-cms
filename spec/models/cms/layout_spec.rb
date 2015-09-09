require 'rails_helper'

RSpec.describe Cms::Layout, type: :model do

  let(:layout) {FactoryGirl.create(:layout)}

  it "should have valid layout factory" do
    expect(layout).to be_valid
  end

  it "should require a type" do
    layout.type = nil
    expect(layout).to be_invalid
  end

end