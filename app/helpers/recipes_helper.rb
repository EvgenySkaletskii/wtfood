module RecipesHelper
  def comments(recipe)
    if recipe.comments.count > 0
      "| Comments: #{recipe.comments.count}"
    end
  end
end
