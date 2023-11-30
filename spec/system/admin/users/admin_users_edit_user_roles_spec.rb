require "rails_helper"

RSpec.describe "Admin::Users::EditUserRoles", type: :system do
  before do
    login_as create(:user, :admin)
  end

  describe "update user role" do
    let(:account_user) { create(:account_user) }

    context "update with valid parameters" do
      xit "should update user role" do
        create(:role, name: "member")
        visit admin_account_user_path(account_user)
        click_link "Edit Role"
        find("option[value='member']").click
        click_button "Save"

        expect(page).to have_content("Member")
        debug(binding)
      end
    end
  end
end
