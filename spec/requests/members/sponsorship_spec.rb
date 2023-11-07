require "rails_helper"

RSpec.describe "Members::Sponsorships", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/members/sponsorship/index"
      expect(response).to have_http_status(:success)
    end
  end
end
