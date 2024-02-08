require "rails_helper"

RSpec.describe "AdminUserUpdates", type: :system do
  before do
    login_as create(:user, :super_admin)
  end

  context "with valid attributes" do
    it "updates user" do
      role = create(:role)
      account = create(:account)
      user = create(:user, account: account, account_users_attributes: [{ account_id: account.id, role_id: role.id }])
      visit admin_user_path(user)
      click_on "Edit"
      fill_in "Name", with: "New Name"
      fill_in "Username", with: "newusername"
      fill_in "Email", with: "random@example.com"
      select "Member", from: "user_account_users_attributes_0_role_id"
      click_on "Update User"

      expect(page).to have_content "User was successfully updated."
    end
  end

  context "with invalid attributes" do
    it "does not update user" do
      role = create(:role)
      account = create(:account)
      user = create(:user, account: account, account_users_attributes: [{ account_id: account.id, role_id: role.id }])
      visit admin_user_path(user)
      click_on "Edit"
      fill_in "Name", with: ""
      click_on "Update User"

      expect(page).to have_content "Name can't be blank"
    end
  end
end
