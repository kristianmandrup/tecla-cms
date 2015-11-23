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

    it "ability can manage Block" do
      expect(ability.can? :manage, Cms::Models::Block).to be true
    end

    it "ability can manage Image" do
      expect(ability.can? :manage, Cms::Models::Image).to be true
    end

    it "ability can manage User" do
      expect(ability.can? :manage, Cms::User).to be true
    end

    it "ability can manage List" do
      expect(ability.can? :manage, Cms::Models::Block::List).to be true
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

    it "ability can manage Block" do
      expect(ability.can? :manage, Cms::Models::Block).to be true
    end

    it "ability cannot manage User" do
      expect(ability.cannot? :manage, Cms::User).to be true
    end
  end

  context 'publisher user' do
    subject { user }

    before(:each) do
      user.add_role :publisher
    end

    it "should have :publisher role" do
      expect(subject.has_role? :publisher).to be true
    end

    it "ability cannot manage User" do
      expect(ability.cannot? :manage, Cms::User).to be true
    end

    it "ability can manage Block" do
      expect(ability.can? :manage, Cms::Models::Block).to be true
    end

    it "ability can publish Block" do
      expect(ability.can? :publish, Cms::Models::Block).to be true
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

    it "ability cannot manage User" do
      expect(ability.cannot? :manage, Cms::User).to be true
    end

    it "ability can create Block" do
      expect(ability.can? :create, Cms::Models::Block).to be true
    end

    it "ability can edit Block" do
      expect(ability.can? :edit, Cms::Models::Block).to be true
    end

    it "ability can add Block" do
      expect(ability.can? :add, Cms::Models::Block).to be true
    end

    it "ability can stage Block" do
      expect(ability.can? :stage, Cms::Models::Block).to be true
    end
  end

  context 'default user' do
    subject { user }

    before(:each) do
      user.add_role :default
    end

    it "should have :default role" do
      expect(subject.has_role? :default).to be true
    end

    it "ability cannot manage User" do
      expect(ability.cannot? :manage, Cms::User).to be true
    end

    it "ability can read Block" do
      expect(ability.can? :read, Cms::Models::Block).to be true
    end

    it "ability can edit Block" do
      expect(ability.cannot? :update, Cms::Models::Block).to be true
    end
  end
end
