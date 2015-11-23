FactoryGirl.define do
  factory :user, class: 'Cms::User' do
    email { Faker::Internet.email }
    password { 'password' }
    password_confirmation { 'password' }

    factory :super_admin do
      after(:create) { |user| user.add_role(:super_admin) }
    end

    factory :admin do
      after(:create) { |user| user.add_role(:admin) }
    end

    factory :publisher do
      after(:create) { |user| user.add_role(:publisher) }
    end

    factory :author do
      after(:create) { |user| user.add_role(:author) }
    end
  end
end

