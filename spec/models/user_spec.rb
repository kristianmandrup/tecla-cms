require 'rails_helper'

RSpec.describe Cms::User, type: :model do

  let(:user) {FactoryGirl.create(:user)}

  it "should have valid user factory" do
    expect(user).to be_valid
  end

  it "should require a email" do
    user.email = nil
    expect(user).to be_invalid
    expect(user.errors.full_messages).to match_array(["Email can't be blank"])
  end

end


