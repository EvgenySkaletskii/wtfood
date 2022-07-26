require 'rails_helper'

RSpec.describe RecipesController, type: :controller do
  describe "GET /recipes" do
    it "should get all recipes" do
      user = create(:user)
      sign_in(user)
      get :index
      expect(response.status).to eq 200
    end

    it "should redirect to login when not logged in" do
      get :index
      expect(response).to redirect_to("/users/sign_in")
    end
  end

  describe "GET /recipes/:id" do
    it "should show an existed recipe" do
      user = create(:user)
      recipe = create(:recipe)
      sign_in(user)
      get :show, params: {id: recipe.id}
      expect(response.status).to eq 200
    end

    # it "should fail" do
    #   user = create(:user)
    #   recipe = create(:recipe)
    #   sign_in(user)
    #   get :show, params: {id: 10}
    # end
  end
end
