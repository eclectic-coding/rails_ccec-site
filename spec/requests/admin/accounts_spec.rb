require "rails_helper"

RSpec.describe "Admin::Accounts", type: :request do
  before do
    @admin_user = create(:user, :super_admin)
    sign_in @admin_user
  end

  describe "GET /admin/accounts" do
    it "works! (now write some real specs)" do
      get admin_accounts_path
      expect(response).to have_http_status(200)
    end
  end

  describe "GET /admin/accounts/:id" do
    it "works! (now write some real specs)" do
      account = create(:account)
      get admin_account_path(account)
      expect(response).to have_http_status(200)
    end
  end
end
