class FavoriteRecipesController < ApplicationController
  before_action :set_favorite_recipe, only: [:show, :edit, :update, :destroy]

  # GET /favorite_recipes
  # GET /favorite_recipes.json
  def index
    @favorite_recipes = FavoriteRecipe.all
  end

  # GET /favorite_recipes/1
  # GET /favorite_recipes/1.json
  def show
  end

  # GET /favorite_recipes/new
  def new
    @favorite_recipe = FavoriteRecipe.new
  end

  # GET /favorite_recipes/1/edit
  def edit
  end

  # POST /favorite_recipes
  # POST /favorite_recipes.json
  def create
    @favorite_recipe = FavoriteRecipe.new(favorite_recipe_params)

    respond_to do |format|
      if @favorite_recipe.save
        format.html { redirect_to @favorite_recipe, notice: 'Favorite recipe was successfully created.' }
        format.json { render :show, status: :created, location: @favorite_recipe }
      else
        format.html { render :new }
        format.json { render json: @favorite_recipe.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /favorite_recipes/1
  # PATCH/PUT /favorite_recipes/1.json
  def update
    respond_to do |format|
      if @favorite_recipe.update(favorite_recipe_params)
        format.html { redirect_to @favorite_recipe, notice: 'Favorite recipe was successfully updated.' }
        format.json { render :show, status: :ok, location: @favorite_recipe }
      else
        format.html { render :edit }
        format.json { render json: @favorite_recipe.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /favorite_recipes/1
  # DELETE /favorite_recipes/1.json
  def destroy
    @favorite_recipe.destroy
    respond_to do |format|
      format.html { redirect_to favorite_recipes_url, notice: 'Favorite recipe was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_favorite_recipe
      @favorite_recipe = FavoriteRecipe.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def favorite_recipe_params
      params.require(:favorite_recipe).permit(:user_id, :recipe_id)
    end
end
