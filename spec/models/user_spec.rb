require "rails_helper"

RSpec.describe User, type: :model do
  before(:each) do
    @user = User.new(name: "Ivan", email: "ivan@gmail.com", password: "123123123")
  end
  describe "validations" do
    it "should be valid" do
      expect(@user).to be_valid
    end
  end
end
