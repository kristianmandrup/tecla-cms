FactoryGirl.define do
  factory :composite_hash_item, class: "Cms::CompositeHashItem" do
    name { Faker::Name.name }
  end
end
