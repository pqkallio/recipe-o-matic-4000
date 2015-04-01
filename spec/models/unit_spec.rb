require 'rails_helper'

RSpec.describe Unit, :type => :model do
  it "is not valid without a name" do
    uni = Unit.new

    expect(uni.valid?).to eq(false)
  end

  it "is valid with a name" do
    uni = FactoryGirl.create(:unit)

    expect(uni.valid?).to eq(true)
  end

  it "is not valid if another unit with teh same name exists" do
    uni = FactoryGirl.create(:unit)
    uni2 = FactoryGirl.build(:unit)

    expect(uni.valid?).to eq(true)
    expect(uni2.valid?).to eq(false)
  end
end
