class AddSideDishToIngredient < ActiveRecord::Migration
  def change
    add_column :ingredients, :side_dish, :boolean

    Ingredient.all.each do |i|
      i.side_dish = false
      i.save
    end
  end
end
