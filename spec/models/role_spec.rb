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

  context 'admin user' do
    subject { user }

    before(:each) do
      user.add_role :admin
    end

    it "should have :admin role" do
      expect(subject.has_role? :admin).to be true
    end
  end

  context 'Publisher user' do
    subject { user }

    before(:each) do
      user.add_role :publisher
    end

    it "should have :publisher role" do
      expect(subject.has_role? :publisher).to be true
    end
  end

  context 'author user' do
    subject { user }

    before(:each) do
      user.add_role :author
    end

    it "should have :author role" do
      expect(subject.has_role? :author).to be true
    end
  end
end
