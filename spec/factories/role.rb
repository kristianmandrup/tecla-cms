FactoryGirl.define do
  factory :role, class: 'Cms::Role' do
    name { Faker::Lorem.word }
  end
end
