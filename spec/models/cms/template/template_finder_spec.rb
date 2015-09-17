require 'rails_helper'

RSpec.describe Cms::Template::TemplateFinder, type: :model do
 
  let(:template_finder) { Cms::Template::TemplateFinder.instance }
  after(:all) do
    Cms::Template.destroy_all
  end

  it "should find template" do
    template1 = FactoryGirl.create(:template, name: Faker::Name.name )
    template2 =  template_finder.find_template(template1.name)
    expect(template2.name).to eq(template1.name)
  end
  
  it "should find layout" do
    layout = FactoryGirl.create(:template, name: Faker::Name.name , type: "layout")
    template =  template_finder.find_layout(layout.name)
    expect(template.name).to eq(layout.name)
  end
  
  it "should find partial" do
    partial = FactoryGirl.create(:template, name: Faker::Name.name, type: "partial")
    template =  template_finder.find_partial(partial.name)
    expect(template.name).to eq(partial.name)
  end
  
end
