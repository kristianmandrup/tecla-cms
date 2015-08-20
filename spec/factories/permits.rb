FactoryGirl.define do
  factory :default_permit, class: 'Permit' do
    skip_create
    initialize_with { Permit.create(:default) }
  end
end
