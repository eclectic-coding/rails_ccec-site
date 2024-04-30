require 'rails_helper'

RSpec.describe "PrayerVigils", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get prayer_vigils_path
      expect(response).to have_http_status(:success)
    end
  end
end
