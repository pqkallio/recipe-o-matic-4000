require 'test_helper'

class FavoriteRecipesControllerTest < ActionController::TestCase
  setup do
    @favorite_recipe = favorite_recipes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:favorite_recipes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create favorite_recipe" do
    assert_difference('FavoriteRecipe.count') do
      post :create, favorite_recipe: { recipe_id: @favorite_recipe.recipe_id, user_id: @favorite_recipe.user_id }
    end

    assert_redirected_to favorite_recipe_path(assigns(:favorite_recipe))
  end

  test "should show favorite_recipe" do
    get :show, id: @favorite_recipe
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @favorite_recipe
    assert_response :success
  end

  test "should update favorite_recipe" do
    patch :update, id: @favorite_recipe, favorite_recipe: { recipe_id: @favorite_recipe.recipe_id, user_id: @favorite_recipe.user_id }
    assert_redirected_to favorite_recipe_path(assigns(:favorite_recipe))
  end

  test "should destroy favorite_recipe" do
    assert_difference('FavoriteRecipe.count', -1) do
      delete :destroy, id: @favorite_recipe
    end

    assert_redirected_to favorite_recipes_path
  end
end
