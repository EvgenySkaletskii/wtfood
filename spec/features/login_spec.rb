require "rails_helper"

RSpec.feature "Login", type: :feature do
  describe "Login and logout fuctionality" do
    let(:user) { create(:user) }
    let(:login_page) { LoginPage.new }
    let(:recipes_page) { RecipesPage.new }

    before(:each) do
      visit new_user_session_path
    end

    it "should sign in a user" do
      login_page.email_field.set(user.email)
      login_page.password_field.set(user.password)
      login_page.submit_button.click
      expect(page).to have_text "Signed in successfully."
      expect(recipes_page).to have_recipes
      #user can logout
      recipes_page.logout_button.click
      expect(page).to have_text "Signed out successfully."
      expect(login_page).to have_email_field
    end
  end
end
