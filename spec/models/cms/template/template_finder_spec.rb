require 'rails_helper'

RSpec.describe Cms::Template::TemplateFinder, type: :model do
 
  let(:template_finder) { Cms::Template::TemplateFinder.instance }

  it "should find template" do
    template1 = FactoryGirl.create(:template, name: 'my_template1')
    template2 =  template_finder.find_template(template1.name)
    expect(template2.name).to eq(template1.name)
  end
  
  it "should find layout" do
    layout = FactoryGirl.create(:template, name: 'my_layout1', type: "layout")
    template =  template_finder.find_layout(layout.name)
    expect(template.name).to eq(layout.name)
  end
  
  it "should find partial" do
    partial = FactoryGirl.create(:template, name: 'my_partial1', type: "partial")
    template =  template_finder.find_partial(partial.name)
    expect(template.name).to eq(partial.name)
  end
  
end
