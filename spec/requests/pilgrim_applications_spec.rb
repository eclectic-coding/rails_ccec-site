require 'rails_helper'

RSpec.describe "PilgrimApplications", type: :request do
  describe "GET /create" do
    it "returns http success" do
      get "/pilgrim_applications/create"
      expect(response).to have_http_status(:success)
    end
  end
end
