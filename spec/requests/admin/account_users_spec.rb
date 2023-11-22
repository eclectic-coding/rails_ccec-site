require "rails_helper"

RSpec.describe "Admin::AccountUsers", type: :request do
  before do
    @admin_user = create(:user, :super_admin)
    sign_in @admin_user
  end

  describe "GET /admin/account_users (show)" do
    it "shows user profile" do
      account_user = create(:account_user)
      get admin_account_user_path(account_user, user_id: account_user.user_id)
      expect(response).to have_http_status(200)
    end
  end

  describe "GET /admin/account_users/new" do
    it "renders successful response" do
      get new_admin_account_user_path
      expect(response).to have_http_status(200)
    end
  end

  describe "CREATE /admin/account_users" do
    context "with valid parameters" do
      xit "creates a new account user" do
        expect {
          post admin_account_users_path, params: { account_user: {
            name: "Test User", email: "test@example.com", role_id: Role.find_by(name: create(:account).name)
          } }
        }.to change(AccountUser, :count).by(1)
      end

      xit "redirects to the created account user" do
        post admin_account_users_path, params: { account_user: {
          name: "Test User", email: "test@example.com", role_id: Role.find_by(name: create(:account).name)
        } }
        expect(response).to redirect_to(admin_accounts_path)
      end
    end
  end

  describe "DELETE /admin/account_users" do
    xit "destroys the requested account user" do
      account_user = create(:account_user)
      expect {
        delete admin_account_user_path(account_user, user_id: account_user.user_id)
      }.to change(AccountUser, :count).by(-1)
    end
  end
end
