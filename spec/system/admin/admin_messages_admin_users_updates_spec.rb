require 'rails_helper'

RSpec.describe "AdminUserUpdates", type: :system do
  before do
    login_as create(:user, :super_admin)
  end

  context "with valid attributes" do
    it "updates user" do
      user = create(:user)
      visit admin_user_path(user)
      click_on "Edit"
      fill_in "Name", with: "New Name"
      fill_in "Username", with: "newusername"
      fill_in "Email", with: "random@example.com"
      click_on "Update User"

      expect(page).to have_content "User was successfully updated."
    end
  end
end
