require 'rails_helper'

RSpec.describe Permit, type: :model do
  let(:permit) {FactoryGirl.create(:default_permit)}
  let(:user) {FactoryGirl.create(:user)}

  let(:ability) {Ability.new(user)}

  context 'Ability with default permit' do
    subject { ability }

    before(:each) do
      permit.access(subject)
    end

    it "should be NOT able to edit a Cms::Block" do
      expect(subject.can? :edit, Cms::Block).to be false
    end

    it "should be able to read a Cms::Block" do
      expect(subject.can? :read, Cms::Block).to be false
    end
  end
end
