require 'rails_helper'

RSpec.describe Recipe, :type => :model do
  it "is valid if all is in place" do
    recipe = FactoryGirl.build(:recipe)
    expect(recipe.valid?).to eq(true)
    expect(Recipe.count).to eq(0)

    recipe.save
    expect(Recipe.count).to eq(1)
  end

  it "is not valid if name is missing" do
    recipe = FactoryGirl.build(:recipe, name: nil)

    expect(recipe.valid?).to eq(false)
  end

  it "is not valid if portions is less than minimum" do
    recipe = FactoryGirl.build(:recipe, portions: 0)

    expect(recipe.valid?).to eq(false)
  end

  it "is not valid if portions is more than maximum" do
    recipe = FactoryGirl.build(:recipe, portions: 1001)

    expect(recipe.valid?).to eq(false)
  end

  it "is not valid if portions is not an integer" do
    recipe = FactoryGirl.build(:recipe, portions: 1.5)

    expect(recipe.valid?).to eq(false)
  end

  it "is not valid if instructions is missing" do
    recipe = FactoryGirl.build(:recipe, instructions: nil)

    expect(recipe.valid?).to eq(false)
  end

  it "is not valid if cooking is missing" do
    recipe = FactoryGirl.build(:recipe, cooking: nil)

    expect(recipe.valid?).to eq(false)
  end

  it "with 1 ingredient has 1 ingredient" do
    recipe = FactoryGirl.create(:recipe)
    FactoryGirl.create(:ingredient, recipe: recipe)
    recipe.save

    expect(recipe.ingredients.count).to eq(1)
  end

  it "with 3 ingredients has 3 ingredients" do
    recipe = FactoryGirl.create(:recipe)
    FactoryGirl.create(:ingredient, recipe: recipe)
    FactoryGirl.create(:ingredient, recipe: recipe, material: FactoryGirl.create(:material2), unit: FactoryGirl.create(:unit2))
    FactoryGirl.create(:ingredient, recipe: recipe, material: FactoryGirl.create(:material3), unit: FactoryGirl.create(:unit3))
    recipe.save

    expect(recipe.ingredients.count).to eq(3)
  end
end
