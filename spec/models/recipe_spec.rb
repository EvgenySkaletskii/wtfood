require "rails_helper"

RSpec.describe Recipe, type: :model do
  describe "validations" do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:body) }
    it { should validate_length_of(:title).is_at_most(40) }
    it { should validate_length_of(:body).is_at_most(200) }
  end

  describe "relations" do
    it { should belong_to(:user) }
    it { should have_many(:comments) }
    it { should have_many(:likes) }
    it { should have_many(:ingredients) }
    it { should have_many(:products).through(:ingredients) }
  end

  describe "nested attributes" do
    it { should accept_nested_attributes_for(:ingredients) }
  end
end
