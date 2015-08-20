

FactoryGirl.define do
  factory :image, class: "Cms::Image" do
    title { Faker::Name.name }
    content { Faker::Lorem.paragraph(10) }
  end
end
