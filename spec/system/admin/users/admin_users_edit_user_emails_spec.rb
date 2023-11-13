require "system_helper"

RSpec.describe "Admin::Users::EditUserEmails", type: :system do
  before do
    login_as create(:user, :admin)
  end

  describe "update user email" do
    let(:account_user) { create(:account_user) }

    context "update with valid parameters" do
      it "should update user email" do
        visit admin_account_user_path(account_user, user_id: account_user.user_id)
        click_link "Edit Email"
        fill_in "email", with: "name@example.com"
        click_button "Save"

        expect(page).to have_content("name@example.com")
      end
    end

    context "update with invalid parameters" do
      it "should not update user email" do
        visit admin_account_user_path(account_user, user_id: account_user.user_id)
        click_link "Edit Email"
        fill_in "email", with: ""
        click_button "Save"

        expect(page).to have_field("email", with: "")
      end
    end
  end
end
