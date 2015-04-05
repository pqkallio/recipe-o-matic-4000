class CreateRecipeInstructionPhases < ActiveRecord::Migration
  def change
    create_table :recipe_instruction_phases do |t|
      t.integer :recipe_id
      t.integer :phase
      t.text :content

      t.timestamps null: false
    end
  end
end
