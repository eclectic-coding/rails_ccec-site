require "rails_helper"

RSpec.describe "Admin::Users::EditUserNames", type: :system do
  before do
    driven_by(:selenium_chrome_headless)
  end

  before do
    login_as create(:user, :admin)
    WebMock.allow_net_connect!
  end

  describe "update user name" do
    let(:account_user) { create(:account_user) }

    context "update with valid parameters" do
      it "should update user name" do
        visit admin_account_user_path(account_user)
        click_link "Edit Name"
        fill_in "name", with: "Test User"
        click_button "Save"

        expect(page).to have_content("Test User")
      end
    end

    context "update with invalid parameters" do
      it "should update user name" do
        visit admin_account_user_path(account_user)
        click_link "Edit Name"
        fill_in "name", with: ""
        click_button "Save"

        expect(page).to have_content("Name can't be blank")
      end
    end
  end
end
