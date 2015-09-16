FactoryGirl.define do
  factory :template, class: 'Cms::Template' do
    name { Faker::Name.name }
    content { Faker::Lorem.paragraph(10) }
  end
end
