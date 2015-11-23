FactoryGirl.define do
  factory :menu_item, class: 'Cms::Models::Menu::Item' do
    icon { Faker::Lorem.word }
    # [FIXME]: Don't remove `to_s` from `locale` as there is some issue in
    # Mongoid that it can't read symbol keys in `attribute_translations`.
    label_translations (Hash[I18n.available_locales.map { |locale| [locale.to_s, Faker::Lorem.word] }])
    link_translations (Hash[I18n.available_locales.map { |locale| [locale.to_s, Faker::Lorem.word] }])
  end
end
