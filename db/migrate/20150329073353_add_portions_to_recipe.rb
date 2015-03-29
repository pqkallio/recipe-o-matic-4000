class AddPortionsToRecipe < ActiveRecord::Migration
  def change
    add_column :recipes, :portions, :integer

    Recipe.all.each do |r|
      r.portions = 1
      r.save
    end
  end
end
