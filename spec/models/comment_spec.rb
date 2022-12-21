# frozen_string_literal: true

require "rails_helper"

RSpec.describe Comment, type: :model do
  describe "validations" do
    it { should validate_presence_of(:body) }
    it { should validate_presence_of(:user_id) }
    it { should validate_presence_of(:recipe_id) }
    it { should validate_length_of(:body).is_at_most(200) }
  end

  describe "associations" do
    it { should belong_to(:user) }
    it { should belong_to(:recipe) }
    it { should have_many(:likes) }
  end
end
