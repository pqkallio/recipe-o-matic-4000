class AddSideDishToMaterial < ActiveRecord::Migration
  def change
    add_column :materials, :side_dish, :boolean

    Material.all.each do |m|
      m.side_dish = false
      m.save
    end
  end
end
