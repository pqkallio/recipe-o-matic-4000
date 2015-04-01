require 'rails_helper'

RSpec.describe Material, :type => :model do
  it "is not valid without a name" do
    mat = Material.new

    expect(mat.valid?).to eq(false)
  end

  it "is valid with a name" do
    mat = FactoryGirl.create(:material)

    expect(mat.valid?).to eq(true)
  end

  it "is not valid if a second material is made with the same name" do
    mat1 = FactoryGirl.create(:material)
    mat2 = FactoryGirl.build(:material)

    expect(mat1.valid?).to eq(true)
    expect(mat2.valid?).to eq(false)
  end
end
