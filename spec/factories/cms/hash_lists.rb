FactoryGirl.define do
  factory :hash_list, class: "Cms::HashList" do
    name { Faker::Name.name }
  end
end
