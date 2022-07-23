require "rails_helper"

RSpec.describe User, type: :model do
  describe "validations" do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:password) }
  end

  describe "relations" do
    it { should have_many(:recipes) }
    it { should have_many(:comments) }
    it { should have_many(:likes) }
  end

  describe "liked? method" do
    context "posts" do
      it "returns true when post is liked by user" do
        user = create(:user)
      end
    end
  end
end
