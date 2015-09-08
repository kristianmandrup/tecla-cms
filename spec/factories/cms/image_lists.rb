FactoryGirl.define do
  factory :image_list, class: "Cms::ImageList" do
    name { Faker::Name.name }
  end
end
