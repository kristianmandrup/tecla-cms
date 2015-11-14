FactoryGirl.define do
  factory :menu, class: 'Cms::Models::Menu' do
    name { Faker::Lorem.characters(10) }
  end
end
