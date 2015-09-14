FactoryGirl.define do
  factory :component, class: "Cms::Component" do
    name { Faker::Name.name }
  end
end
