require 'rails_helper'

RSpec.describe Cms::Document, type: :model do

  let(:document) {FactoryGirl.create(:document)}
  after(:all) do
    Cms::Document.destroy_all
  end

  it "should have valid document factory" do
    expect(document).to be_valid
  end

  it "should require a title" do
    document.name = nil
    expect(document).to be_invalid
  end
end
