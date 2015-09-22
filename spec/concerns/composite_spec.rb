require 'rails_helper'

class CompositeModel < Cms::Document
  include_concerns :composite
end

describe Composite do
  let(:composite_model) { CompositeModel.create position: 0 }
  it "should have orderable" do
    composite_model
    composite_model1 = CompositeModel.create position: 1
    composite_model2 = CompositeModel.create position: 2
    
    expect(composite_model.position).to eq(0)
    expect(composite_model1.position).to eq(1)
    expect(composite_model2.position).to eq(2)
    
    composite_model.move_to! 1
    expect(composite_model.position).to eq(1)
  end
  
  it "should return type" do
    expect(composite_model.type).to eq("CompositeModel")
  end
  
  it "should get all list"
  
  it "should get hash"
  
end
