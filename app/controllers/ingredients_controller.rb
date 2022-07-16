class IngredientsController < ApplicationController
  def destroy
    @recipe = Recipe.new
    @recipe.ingredients.build.build_product
  end
end
