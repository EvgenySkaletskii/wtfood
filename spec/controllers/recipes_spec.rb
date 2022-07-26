require "rails_helper"

RSpec.describe RecipesController, type: :controller do
  let(:user) { create(:user) }

  before(:each) do
    sign_in(user)
  end

  describe "GET /recipes" do
    it "should get all recipes" do
      get :index
      expect(response.status).to eq 200
    end

    it "should redirect to login when not logged in" do
      sign_out(user)
      get :index
      expect(response).to redirect_to("/users/sign_in")
    end
  end

  describe "GET /recipes/:id" do
    let(:recipe) { create(:recipe) }

    it "should show an existed recipe" do
      get :show, params: { id: recipe.id }
      expect(response.status).to eq 200
    end

    it "should redirect to login when not logged in" do
      sign_out(user)
      get :show, params: { id: recipe.id }
      expect(response).to redirect_to("/users/sign_in")
    end
  end

  describe "GET /recipes/new" do
    it "should allow to view new recipe page" do
      get :new
      expect(response.status).to eq 200
    end

    it "should redirect to login when not logged in" do
      sign_out(user)
      get :new
      expect(response).to redirect_to("/users/sign_in")
    end
  end

  describe "GET /recipes/:id/edit" do
    let(:recipe) { create(:recipe) }

    it "should allow to edit recipe" do
      get :edit, params: { id: recipe.id }
      expect(response.status).to eq 200
    end

    it "should redirect to login when not logged in" do
      sign_out(user)
      get :edit, params: { id: recipe.id }
      expect(response).to redirect_to("/users/sign_in")
    end
  end

  describe "POST /recipes" do
    it "should create a new recipe" do
      expect do
        post :create, params: { recipe: attributes_for(:recipe) }
      end.to change(Recipe, :count).by(1)
    end

    it "should redirect to login when not logged in" do
      sign_out(user)
      post :create, params: { recipe: attributes_for(:recipe) }
      expect(response).to redirect_to("/users/sign_in")
    end
  end

  describe "PUT /recipes/:id" do
    let(:recipe) { create(:recipe) }
    it "should update a recipe" do
      put :update, params: { id: recipe.id, recipe: { title: "New recipe" } }
      recipe.reload
      expect(recipe.title).to eq("New recipe")
    end

    it "should redirect to login when not logged in" do
      sign_out(user)
      put :update, params: { id: recipe.id, recipe: { title: "New recipe" } }
      expect(response).to redirect_to("/users/sign_in")
    end
  end

  describe "DELETE /recipes/:id" do
    let(:recipe) { create(:recipe) }
    it "should delete a recipe" do
      user.recipes.create(attributes_for(:recipe))
      expect do
        delete :destroy, params: { id: user.recipes.first.id }
      end.to change(Recipe, :count).by(-1)
    end

    it "should redirect to login when not logged in" do
      sign_out(user)
      delete :destroy, params: { id: recipe.id }
      expect(response).to redirect_to("/users/sign_in")
    end
  end
end
