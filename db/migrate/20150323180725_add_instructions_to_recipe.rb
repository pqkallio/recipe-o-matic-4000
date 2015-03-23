class AddInstructionsToRecipe < ActiveRecord::Migration
  def change
    add_column :recipes, :instructions, :text

    ins = "Do it as well as you can!"
    
    Recipe.all.each do |r|
      r.instructions = ins
      r.save
    end
  end
end
