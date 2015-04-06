class RecipesController < ApplicationController
  before_action :set_recipe, only: [:show, :edit, :update, :destroy]

  # GET /recipes
  # GET /recipes.json
  def index
    @recipes = Recipe.all
  end

  # GET /recipes/1
  # GET /recipes/1.json
  def show
    @recipe_instruction_phases = RecipeInstructionPhase.where(recipe_id: @recipe.id).order(phase: :asc)
    unless current_user.nil?
      @favorite_recipe = FavoriteRecipe.find_by(user_id: current_user.id, recipe_id: @recipe.id)
    end
  end

  # GET /recipes/new
  def new
    @recipe = Recipe.new
  end

  # GET /recipes/1/edit
  def edit
  end

  # POST /recipes
  # POST /recipes.json
  def create
    @recipe = Recipe.new(recipe_params)
    @ingredients = params[:recipe][:ingredients]
    @phases = params[:recipe][:recipe_instruction_phases]
    @recipe.user = current_user
    byebug
    respond_to do |format|
      if @recipe.save
        current_user.recipes << @recipe
        add_ingredients
        add_phases
        current_user.save
        format.html { redirect_to @recipe, notice: 'Recipe was successfully created.' }
        format.json { render :show, status: :created, location: @recipe }
      else
        format.html { render :new }
        format.json { render json: @recipe.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /recipes/1
  # PATCH/PUT /recipes/1.json
  def update
    respond_to do |format|
      if @recipe.update(recipe_params)
        format.html { redirect_to @recipe, notice: 'Recipe was successfully updated.' }
        format.json { render :show, status: :ok, location: @recipe }
      else
        format.html { render :edit }
        format.json { render json: @recipe.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /recipes/1
  # DELETE /recipes/1.json
  def destroy
    @recipe.destroy
    respond_to do |format|
      format.html { redirect_to recipes_url, notice: 'Recipe was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def add_ingredients
    @ingredients.each do |ing, values|
      ingredient = Ingredient.new

      set_material_amount_and_recipe(ingredient, values)
      set_side_dishness(ingredient, ing.to_s)
      set_unit(ingredient, values["unit"])

      ingredient.save
    end
  end

  def set_material_amount_and_recipe(ingredient, values)
    material = Material.find_by(name: values["material"])

    if material.nil?
      material = Material.create(name: values["material"])
    end

    ingredient.material = material
    ingredient.amount = values["amount"]
    ingredient.recipe = @recipe
  end

  def set_side_dishness(ingredient, value)
    if value == "side_dish"
      ingredient.side_dish = true
      ingredient.material.side_dish = true
      ingredient.material.save
    else
      ingredient.side_dish = false
    end
  end

  def set_unit(ingredient, unit_name)
    unit = Unit.find_by(name: unit_name)

    if unit.nil?
      unit = Unit.create(name: unit_name)
    end

    ingredient.unit = unit
  end

  def add_phases
    @phases.each do |p, values|
      phase = RecipeInstructionPhase.new
      phase.phase = values["phase"]
      phase.content = values["content"]
      phase.recipe = @recipe
      phase.save
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_recipe
      @recipe = Recipe.includes(ingredients: [:unit, :material]).includes(:user).find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def recipe_params
      params.require(:recipe).permit(:user_id, :name, :cooking, :description, :instructions, :portions)
    end
end
