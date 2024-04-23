require "rails_helper"

RSpec.describe "Admin::Accounts", type: :request do
  before do
    @admin_user = create(:user, :super_admin)
    sign_in @admin_user
  end

  describe "GET /admin/accounts" do
    it "works! (now write some real specs)" do
      get admin_accounts_path
      expect(response).to have_http_status(:ok)
    end
  end
end
