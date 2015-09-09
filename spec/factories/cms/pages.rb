FactoryGirl.define do
  factory :page, class: 'Cms::Page' do
    name { Faker::Name.name }
  end
end
