# frozen_string_literal: true

class RecipesPage < SitePrism::Page
  element :recipes, "#recipes"
  element :logout_button, :button, "Logout"
end
