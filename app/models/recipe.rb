class Recipe < ActiveRecord::Base
  has_many :ingredients, dependent: :destroy
  has_many :materials, through: :ingredients
  has_many :units, through: :ingredients
  belongs_to :user

  def self.containing_material(material)
    recipes = Array.new
    ingredients = Ingredient.where(material: material)

    ingredients.each do |i|
      recipes.append(Recipe.find(i.recipe_id))
    end

    recipes
  end
end
