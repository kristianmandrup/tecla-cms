

FactoryGirl.define do
  factory :image, class: "Cms::Image" do
    title { Faker::Name.name }
    name { Faker::Name.name }
    content { Rack::Test::UploadedFile.new(File.join(Rails.root, 'public', 'a2.jpg')) }
  end
end
