# frozen_string_literal: true

require "rails_helper"

RSpec.describe Product, type: :model do
  describe "validation" do
    it { should validate_presence_of(:name) }
    it { should validate_length_of(:name).is_at_most(40) }
  end

  describe "associations" do
    it { should have_many(:ingredients) }
    it { should have_many(:recipes).through(:ingredients) }
  end
end
