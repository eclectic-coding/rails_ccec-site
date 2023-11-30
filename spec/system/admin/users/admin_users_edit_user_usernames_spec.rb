require "rails_helper"

RSpec.describe "Admin::Users::EditUserUsernames", type: :system do
  before do
    login_as create(:user, :admin)
  end

  describe "update user username" do
    let(:account_user) { create(:account_user) }

    context "update with valid parameters" do
      it "should update user username" do
        visit admin_account_user_path(account_user, user_id: account_user.user.id)
        click_link "Edit Username"
        fill_in "username", with: "testuser"
        click_button "Save"

        expect(page).to have_content("testuser")
      end
    end

    context "update with invalid parameters" do
      it "should update user username" do
        visit admin_account_user_path(account_user, user_id: account_user.user.id)
        click_link "Edit Username"
        fill_in "username", with: ""
        click_button "Save"

        expect(page).to have_content("Username can't be blank")
      end
    end
  end
end
