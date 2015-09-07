FactoryGirl.define do
  factory :composite_item, class: "Cms::CompositeItem" do
    name { Faker::Name.name }
  end
end
