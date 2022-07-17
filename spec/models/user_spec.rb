require "rails_helper"

RSpec.describe User, type: :model do
  before(:each) do
    @user = create(:user)
  end

  describe "validations" do
    it "should be valid" do
      expect(@user).to be_valid
    end

    it "should have name" do
      @user.name = nil
      expect(@user).to_not be_valid
    end
  end
end
