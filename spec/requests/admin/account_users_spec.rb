require "rails_helper"

RSpec.describe "Admin::AccountUsers", type: :request do
  before do
    @admin_user = create(:user, :super_admin)
    sign_in @admin_user
  end

  describe "GET /admin/account_users/new" do
    it "renders successful response" do
      get new_admin_account_user_path
      expect(response).to have_http_status(200)
    end
  end
end
