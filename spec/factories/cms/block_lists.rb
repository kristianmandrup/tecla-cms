FactoryGirl.define do
  factory :block_list, class: "Cms::BlockList" do
    name { Faker::Name.name }
  end
end
