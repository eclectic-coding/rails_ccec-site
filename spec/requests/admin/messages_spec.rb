require "rails_helper"

RSpec.describe "Admin::Messages", type: :request do
  describe "GET /index" do
    it "returns http success" do
      login_as(create(:user, :admin))
      get admin_messages_path
      expect(response).to have_http_status(:success)
    end
  end
end
