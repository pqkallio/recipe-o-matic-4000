class CreateRecipes < ActiveRecord::Migration
  def change
    create_table :recipes do |t|
      t.integer :user_id
      t.string :name
      t.string :cooking
      t.text :description

      t.timestamps null: false
    end
  end
end
