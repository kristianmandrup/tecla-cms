
FactoryGirl.define do
  factory :layout, class: 'Cms::Layout' do
    name { Faker::Name.name }
    type {"list"}
  end
end
