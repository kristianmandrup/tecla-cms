# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :list, class: "Cms::List" do
    name { Faker::Name.name }
    #composite_items {FactoryGirl.create(:list)}
  end
end
