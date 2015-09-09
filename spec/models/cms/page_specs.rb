require 'rails_helper'

RSpec.describe Cms::Page, type: :model do

  let(:page) {FactoryGirl.create(:page)}

  it "should have valid page factory" do
    expect(page).to be_valid
  end

  it "should have nested item" do
    page = FactoryGirl.create(:page)
    list = FactoryGirl.create(:list, page: page)
    image = FactoryGirl.create(:image_list, page: page)
    block = FactoryGirl.create(:block_list, page: page)
    object = FactoryGirl.create(:hash_list, page: page)


    response = page.nested_item

    expect(response['lists']).to include{list.name }
    expect(response['images']).to include{image.title }
    expect(response['blocks']).to include{block.name }
    expect(response['objects']).to include{object.name }

  end

end