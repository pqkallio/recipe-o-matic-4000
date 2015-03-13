json.array!(@ingredients) do |ingredient|
  json.extract! ingredient, :id, :recipe_id, :material_id, :amount, :unit_id
  json.url ingredient_url(ingredient, format: :json)
end
