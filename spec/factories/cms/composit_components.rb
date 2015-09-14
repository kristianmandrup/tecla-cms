FactoryGirl.define do
  factory :composite_component, class: "Cms::CompositeComponent" do
    name { Faker::Name.name }
  end
end
