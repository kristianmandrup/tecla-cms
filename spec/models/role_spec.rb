require 'rails_helper'

RSpec.describe 'User roles', type: :model do
  let(:user) {FactoryGirl.create(:user)}

  context 'super_admin user' do
    subject { user }

    before(:each) do
      user.add_role :super_admin
    end

    it "should have :super_admin role" do
      expect(subject.has_role? :super_admin).to be true
    end
  end
end
