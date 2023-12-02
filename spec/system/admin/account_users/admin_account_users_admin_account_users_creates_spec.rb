require "rails_helper"

RSpec.describe "Admin::AccountUsers::AdminAccountUsersCreates", type: :system do
  before do
    login_as create(:user, :admin)
    create(:role, name: "member")
    visit admin_accounts_path
  end

  describe "create account user" do
    context "with valid parameters" do
      it "should create account user" do
        click_link "New User"
        fill_in "account_user_username", with: "username"
        fill_in "account_user_name", with: "John Doe"
        fill_in "account_user_email", with: "user@example.com"
        select("Member", from: "account_user_role_id")
        click_button "Create User"

        expect(page).to have_content("John Doe")
      end
    end

    context "with invalid parameters" do
      it "should create account user" do
        click_link "New User"
        fill_in "account_user_username", with: ""
        fill_in "account_user_name", with: "John Doe"
        fill_in "account_user_email", with: "user@example.com"
        select("Member", from: "account_user_role_id")
        click_button "Create User"

        expect(response).to eq(nil)
      end
    end
  end
end
