require "rails_helper"

RSpec.describe "UserLogins", type: :system do
  describe "login" do
    it "logs in member user with valid credentials" do
      user = create(:user, :member)

      visit new_user_session_path
      fill_in "user_login", with: user.username
      fill_in "user_password", with: user.password
      click_button "Log in"
      expect(page).to have_current_path(root_path, ignore_query: true)
    end

    it "logs in admin user with valid credentials" do
      admin_user = create(:user, :admin)

      visit new_user_session_path
      fill_in "user_login", with: admin_user.username
      fill_in "user_password", with: admin_user.password
      click_button "Log in"
      expect(page).to have_current_path(admin_root_path, ignore_query: true)
    end
  end
end
