# frozen_string_literal: true

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
    context "recipes" do
      let(:like) { create(:like, :for_recipe) }
      let(:user_who_liked) { like.user }
      let(:user) { create(:user) }
      let(:recipe) { like.likeable }

      it "returns true when recipe is liked by user" do
        expect(user_who_liked.liked?(recipe)).to be true
      end

      it "returns false when recipe is not liked by user" do
        expect(user.liked?(recipe)).to be false
      end
    end

    context "comments" do
      let(:like) { create(:like, :for_comment) }
      let(:user_who_liked) { like.user }
      let(:user) { create(:user) }
      let(:comment) { like.likeable }

      it "returns true when comment is liked by user" do
        expect(user_who_liked.liked?(comment)).to be true
      end

      it "returns false when recipe is not liked by user" do
        expect(user.liked?(comment)).to be false
      end
    end
  end
end
