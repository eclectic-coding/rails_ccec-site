require 'rails_helper'

RSpec.describe "PilgrimApplications", type: :request do
  describe "GET /new" do
    it "returns http success" do
      get new_pilgrim_application_path
      expect(response).to have_http_status(:success)
    end
  end
end
