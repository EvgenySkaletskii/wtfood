# frozen_string_literal: true

class IngredientsController < ApplicationController
  before_action :set_ingredient

  def new
  end

  def destroy
  end

  private

    def set_ingredient
      @recipe = Recipe.new
      @recipe.ingredients.build.build_product
    end
end
