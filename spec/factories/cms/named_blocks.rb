# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :named_block, class: 'Cms::NamedBlock' do
    name { Faker::Name.name }
  end
end
