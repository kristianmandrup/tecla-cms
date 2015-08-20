require 'rails_helper'

RSpec.describe Ability, type: :model do
  let(:user) {FactoryGirl.create(:user)}

  let(:ability) {Ability.new(subject)}

  context 'super_admin user' do
    subject { user }

    before(:each) do
      user.add_role :super_admin
    end

    it "should have :super_admin role" do
      expect(subject.has_role? :super_admin).to be true
    end

    it "ability can edit Block" do
      expect(ability.can? :edit, Cms::Block).to be true
    end
  end
end
