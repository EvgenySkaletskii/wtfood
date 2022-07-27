require 'rails_helper'

RSpec.describe LikesController, type: :controller do
  let(:user) { create(:user) }
  let(:recipe) { create(:recipe, user: user)}
  let(:comment) { create(:comment, user: user, recipe: recipe) }

  before do 
    allow(controller).to receive(:current_user) { user } 
    request.env['HTTP_REFERER'] = recipe_path(recipe)
  end

  before(:each) { sign_in(user) }

  describe "POST #create" do

    context "user hasn't liked it before" do
      it "should create a new like for recipe" do
        expect do
          post :create, params: { likeable_id: recipe.id, likeable_type: "Recipe" }
        end.to change(Like, :count).by(1)
      end

      it "should create a new like for comment" do
        expect do
          post :create, params: {likeable_id: comment.id, likeable_type: "Comment"}
        end.to change(Like, :count).by(1)
      end
    end

    context "user's liked it before" do
      it "should not create like for recipe" do
        like = create(:like, user: user, likeable_id: recipe.id, likeable_type: "Recipe")
        expect do
          post :create, params: { likeable_id: recipe.id, likeable_type: "Recipe" }
        end.to change(Like, :count).by(0)
      end
    end
  end

  describe "DELETE #destroy" do
    it "should destroy recipe's like" do
      like = create(:like, user: user, likeable_id: recipe.id, likeable_type: "Recipe")
      expect do
        delete :destroy, params: { id: like.id }
      end.to change(Like, :count).by(-1)
    end

    it "should destroy comment's like" do
      like = create(:like, user: user, likeable_id: comment.id, likeable_type: "Comment")
      expect do
        delete :destroy, params: { id: like.id }
      end.to change(Like, :count).by(-1)
    end

    context "destroying not your like" do
      it "should not destory like" do
        another_user = create(:user)
        another_recipe = create(:recipe, user: user)
        like = create(:like, user: another_user, likeable_id: another_recipe.id, likeable_type: "Recipe")
        expect do
          delete :destroy, params: { id: like.id }
        end.to change(Like, :count).by(0)
      end
    end
  end
end
