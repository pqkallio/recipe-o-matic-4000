class CreateIngredients < ActiveRecord::Migration
  def change
    create_table :ingredients do |t|
      t.integer :recipe_id
      t.integer :material_id
      t.decimal :amount
      t.integer :unit_id

      t.timestamps null: false
    end
  end
end
