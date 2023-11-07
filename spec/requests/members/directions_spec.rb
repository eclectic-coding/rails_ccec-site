require "rails_helper"

RSpec.describe "Members::Directions", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/members/directions/index"
      expect(response).to have_http_status(:success)
    end
  end
end
