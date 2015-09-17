FactoryGirl.define do
  factory :document, class: 'Cms::Document' do
    name { Faker::Name.name }
  end
end
