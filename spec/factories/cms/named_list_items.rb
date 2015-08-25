# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :named_list_item, class: 'Cms::NamedListItem' do
    name { Faker::Name.name }
  end
end
