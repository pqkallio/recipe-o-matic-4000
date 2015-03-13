json.array!(@favorite_recipes) do |favorite_recipe|
  json.extract! favorite_recipe, :id, :user_id, :recipe_id
  json.url favorite_recipe_url(favorite_recipe, format: :json)
end
