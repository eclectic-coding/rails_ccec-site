require "rails_helper"

RSpec.describe "Admin::AccountUsers::AdminAccountUsersCreates", type: :system do
  before do
    login_as create(:user, :super_admin)
  end

  describe "when creating an account user" do
    before do
      login_as create(:user, :super_admin)
      create(:role)
      visit admin_accounts_path
      click_link "New User"
    end

    it "creates an account user" do
      fill_in "Username", with: "testuser"
      fill_in "Email", with: "random@example.com"
      fill_in "Name", with: "Test User"
      select "Member", from: "account_user[role_id]"
      click_on "Create User"

      expect(page).to have_text("Account user was successfully created.")
    end
  end
end
