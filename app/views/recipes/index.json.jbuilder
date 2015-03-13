json.array!(@recipes) do |recipe|
  json.extract! recipe, :id, :user_id, :name, :cooking, :description
  json.url recipe_url(recipe, format: :json)
end
