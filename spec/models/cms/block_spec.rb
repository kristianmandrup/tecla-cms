require 'rails_helper'

RSpec.describe Cms::Block, type: :model do

  let(:block) {FactoryGirl.create(:block)}
  after(:all) do
    Cms::Block.destroy_all
  end

  it "should have valid block factory" do
    expect(block).to be_valid
  end

  it "should require a title" do
    block.title = nil
    expect(block).to be_invalid
  end

  # it "should have trackable history and counts" do
  #   user = FactoryGirl.create(:user)
  #   block.update!(title: "test title")
  #   block.update!(title: "new test title")
  #   block.update!(content: "none")
  #   expect(block.title).to eq("new test title")
  #
  #   expect(block.history_tracks.count).to eq(3)
  #   block.undo! user
  #   expect(block.title).to eq("test title")
  # end
  #
  # it "should have orderable" do
  #   block
  #   block1 = FactoryGirl.create(:block)
  #   block2 = FactoryGirl.create(:block)
  #   block2.move_to! 1
  #   expect(block2.position).to eq(1)
  # end
  #
  # it "should return template" do
  #   layout = FactoryGirl.create(:template, :name => "my_layout", :type => "layout", :content => %{
  #     <p>Layout Name: {{ name }} </p>
  #     {{content_for_layout}}
  #   })
  #
  #   block1 = FactoryGirl.create(:block, :title => "block100", content: 'none')
  #   template1 = FactoryGirl.create(:template, :name => "my_template", :templatable => block1, :content => %{
  #     <p> {{ title }} </p>
  #     <p> {{ summary }} </p>
  #     <p> {{ content }} </p>
  #   })
  #
  #   render_template = block1.render(text: 'my_template', layout: 'my_layout')
  #
  # end
end

