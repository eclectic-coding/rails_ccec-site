require "rails_helper"

RSpec.describe "Admin::AccountUsers", type: :request do
  before do
    @admin_user = create(:user, :super_admin)
    sign_in @admin_user
  end

  describe "GET /admin/account_users (show)" do
    it "shows user profile" do
      account_user = create(:account_user)
      get admin_account_user_path(account_user)
      expect(response).to have_http_status(200)
    end
  end

  describe "GET /admin/account_users/new" do
    it "renders successful response" do
      get new_admin_account_user_path
      expect(response).to have_http_status(200)
    end
  end

  describe "EDIT /admin/account_users" do
    it "edits account users name"
    it "edits account users email"
    it "edits account users role"
    it "sends account user password reset email"
  end

  describe "CREATE /admin/account_users" do
    context "with valid parameters" do
      xit "creates a new account user" do
        expect {
          post admin_account_users_path, params: { account_user: attributes_for(:account_user) }
        }.to change(AccountUser, :count).by(1)
      end
    end
  end
end
