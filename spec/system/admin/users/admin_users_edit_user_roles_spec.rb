require "rails_helper"

RSpec.describe "Admin::Users::EditUserRoles", type: :system do
  before do
    login_as create(:user, :admin)
    create(:role, name: "prayer")
  end

  describe "update user role" do
    let(:user) { create(:user, :member) }
    let(:account_user) { user.account_users.first }

    context "update with valid parameters" do
      it "should update user role" do
        visit admin_account_user_path(:account_user, user_id: user.id)
        click_link "Edit Role"
        find("option[value='prayer']").click
        click_button "Save"

        expect(page).to have_content("Member")
      end
    end
  end
end
