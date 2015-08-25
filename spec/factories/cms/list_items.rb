# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :list_item, class: "Cms::ListItem" do
    label { Faker::Name.name }
    link { Faker::Name.name }
    name { Faker::Name.name }
    composite_items {FactoryGirl.create(:list)}
  end
end
