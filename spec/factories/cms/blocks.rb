# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :block, class: 'Cms::Block' do
    name { Faker::Name.name }
    title { Faker::Name.name }
    content { Faker::Lorem.paragraph(10) }
    summary { Faker::Lorem.paragraph(10) }
    position { 0 }
  end
end
