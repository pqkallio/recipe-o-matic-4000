require 'rails_helper'

RSpec.describe Ingredient, :type => :model do
  it "is not valid without a material" do
    ing = Ingredient.new
    ing.recipe = FactoryGirl.create(:recipe)
    ing.unit = FactoryGirl.create(:unit)

    expect(ing.valid?).to eq(false)
  end

  it "is not valid without a recipe" do
    ing = Ingredient.new
    ing.material = FactoryGirl.create(:material)
    ing.unit = FactoryGirl.create(:unit)

    expect(ing.valid?).to eq(false)
  end

  it "is not valid without a unit" do
    ing = Ingredient.new
    ing.material = FactoryGirl.create(:material)
    ing.recipe = FactoryGirl.create(:recipe)

    expect(ing.valid?).to eq(false)
  end

  it "is valid with material, unit and recipe" do
    ing = FactoryGirl.create(:ingredient)

    expect(ing.valid?).to eq(true)
  end
end
