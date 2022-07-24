require "rails_helper"

RSpec.describe Ingredient, type: :model do
  describe "associations" do
    it { should belong_to(:recipe) }
    it { should belong_to(:product) }
    it { should accept_nested_attributes_for(:product) }
  end
end
