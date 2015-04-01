require 'rails_helper'

describe User do
  it "has username set properly" do
    user = User.new username:"johnny"

    expect(user.username).to eq("johnny")
  end

  it "is not saved without a password" do
    user = User.create username:"johnny"

    expect(user.valid?).to be(false)
    expect(User.count).to eq(0)
  end

  it "is saved with a proper password" do
    user = FactoryGirl.create(:user)

    expect(user.valid?).to be(true)
    expect(User.count).to eq(1)
  end

  it "only one user with same username is found in the db" do
    user1 = FactoryGirl.create(:user)
    user2 = FactoryGirl.build(:user)

    expect(user1.valid?).to eq(true)
    expect(user2.valid?).to eq(false)
  end
end
