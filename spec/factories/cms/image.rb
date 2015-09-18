FactoryGirl.define do
  factory :image, class: "Cms::Image" do
    name { Faker::Name.name }
    title { Faker::Name.name }
    position { 0 }
    img_content { Rack::Test::UploadedFile.new(File.join(Rails.root, 'public', 'a2.jpg')) }
  end
end
