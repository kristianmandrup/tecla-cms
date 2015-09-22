require 'rails_helper'

class PrototypeModel

  include Mongoid::Document

  field :name, type: String

  field :title, type: String

  def blueprint_attributes
    nil
  end

end

class BlueprintModel < PrototypeModel

  include_concerns :blueprintable

  blueprint

end

class SimpleBlueprintModel

  include Mongoid::Document

  include_concerns :blueprintable

  field :name, type: String

  field :title, type: String

  blueprint # implicit self

  def blueprint_attributes
    [:name]
  end

end


describe Blueprintable do
  context 'one blueprint model' do
  
    let(:prototype) { SimpleBlueprintModel.create name: 'prototype', title: 'hello world' }
    let(:blueprint) { prototype.blueprints.create  }
    
    it 'should transfer name value from prototype to blueprint' do
      expect(blueprint.name).to eq(prototype.name)
    end
    
    it 'should NOT transfer title value from prototype to blueprint' do
      expect(blueprint.title).not_to eq(prototype.title)
    end
  end
  
  context 'blueprint model is created with prototype' do
    let(:prototype) { BlueprintModel.create name: 'prototype', title: 'hello world' }
    let(:blueprint) { prototype.blueprints.create  }

    it 'should transfer all field values from prototype to blueprint' do
      keys = prototype.fields.keys - ['_id']
      keys.each do |key|
        expect(blueprint[key]).to eq(prototype[key])
      end
    end
  end
  
end
