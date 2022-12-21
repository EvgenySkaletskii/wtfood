# frozen_string_literal: true

require "rails_helper"

RSpec.describe CommentsController, type: :controller do

  let(:user) { create(:user) }
  let(:recipe) { create(:recipe, user:) }
  let!(:comment) { create(:comment, user:, recipe:) }

  before(:each) do
    sign_in(user)
  end

  describe "POST #create" do
    it "should create a new comment" do
      new_comment = {
        body: "Some title",
        user_id: user.id,
        recipe_id: recipe.id
      }
      expect do
        post :create, params: { comment: new_comment }
      end.to change(Comment, :count).by(1)
    end
  end

  describe "PUT #update" do
    it "should update the existed comment" do
      put :update, params: { id: comment.id, comment: { body: "New body!" } }
      comment.reload
      expect(comment.body).to eq("New body!")
    end
  end

  describe "DELETE #destroy" do
    it "should destroy an existed comment" do
      expect do
        delete :destroy, params: { id: comment.id }
      end.to change(Comment, :count).by(-1)
    end
  end
end
