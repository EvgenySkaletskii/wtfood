require "rails_helper"

RSpec.describe ProductsController, type: :controller do
  let(:user) { create(:user)}

  before(:each) do
    sign_in(user)
  end

  describe "POST #create" do
    it "should create a new product" do
      expect do
        post :create, params: {product: attributes_for(:product, user: user)}
      end.to change(Product, :count).by(1)
    end
  end
end