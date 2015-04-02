require 'rails_helper'

describe User do
  it "has username set properly" do
    user_with_password
    expect(@user.username).to eq("johnny")
  end

  it "is not saved without a password" do
    user_with_password(nil, nil)

    expect(@user.valid?).to be(false)
  end

  it "is not saved with a password with no numeral in it" do
    user_with_password("Kokakola", "Kokakola")

    expect(@user.valid?).to eq(false)
  end

  it "is not saved with a password with no capital letter in it" do
    user_with_password("k0kakola", "k0kakola")

    expect(@user.valid?).to eq(false)
  end

  it "is not saved with a password mismatch" do
    user_with_password("K0Kakola", "K0kakola")

    expect(@user.valid?).to eq(false)
  end

  it "is not saved with too short password" do
    user_with_password("K0Kakol", "K0kakol")

    expect(@user.valid?).to eq(false)
  end

  it "is not saved with too long password" do
    user_with_password("K0Kakol", "K0kakol")

    expect(@user.valid?).to eq(false)
  end

  it "is saved with a proper password" do
    user_with_password

    expect(@user.valid?).to be(true)
    @user.save
    expect(User.count).to eq(1)
  end

  it "only one user with same username is found in the db" do
    user_with_password
    @user.save
    user2 = FactoryGirl.build(:user)

    expect(@user.valid?).to eq(true)
    expect(user2.valid?).to eq(false)
  end
end

def user_with_password(password = "K0kakola", password_confirmation = "K0kakola")
  @user = FactoryGirl.build(:user, password: password, password_confirmation: password_confirmation)
end