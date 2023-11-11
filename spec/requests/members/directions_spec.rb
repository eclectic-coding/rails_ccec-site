require "rails_helper"

RSpec.describe "Members::Directions", type: :request do
  describe "GET /index" do
    it "returns http success" do
      sign_in create(:user, :member)
      get members_directions_path
      expect(response).to have_http_status(:success)
    end
  end
end
