require 'rails_helper'

RSpec.describe Cms::CompositeComponent, type: :model do

  let(:composite_component) {FactoryGirl.create(:composite_component)}

  it "should have valid composite_component factory" do
    expect(composite_component).to be_valid
  end

  it "should require a name" do
    composite_component.name = nil
    expect(composite_component).to be_invalid
  end


end
