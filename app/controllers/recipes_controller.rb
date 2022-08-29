class RecipesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_recipe, only: %i[ show edit update destroy ]

  # GET /recipes or /recipes.json
  def index
    @recipes = Recipe.page params[:page]
  end

  # GET /recipes/1 or /recipes/1.json
  def show
    @comment = current_user.comments.build
  end

  # GET /recipes/new
  def new
    @recipe = Recipe.new
    @recipe.ingredients.build.build_product
  end

  # GET /recipes/1/edit
  def edit
  end

  # POST /recipes or /recipes.json
  def create
    @recipe = current_user.recipes.build(recipe_params)

    if @recipe.save
      redirect_to recipes_url, notice: "Recipe was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /recipes/1 or /recipes/1.json
  def update
    if @recipe.update(recipe_params)
      redirect_to recipe_url(@recipe), notice: "Recipe was successfully updated."
    else
      redirect_to edit_recipe_path(@recipe), alert: "Recipe wasn't saved. #{@recipe.errors.full_messages.first}"
    end
  end

  # DELETE /recipes/1 or /recipes/1.json
  def destroy
    @recipe.destroy
    redirect_to recipes_url, notice: "Recipe was successfully destroyed."
  end

  def random
    redirect_to recipe_path(Recipe.random)
  end

  def favorite
    #@recipes = current_user.likes.where(likeable_type: "Recipe")
    #@recipes = Recipe.where()
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_recipe
    @recipe = Recipe.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def recipe_params
    params.require(:recipe).permit(:title, :body, :image, ingredients_attributes: [:id, :amount, :_destroy, product_attributes: [:name]])
  end
end
