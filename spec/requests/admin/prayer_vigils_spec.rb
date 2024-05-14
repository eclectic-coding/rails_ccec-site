require 'rails_helper'

RSpec.describe "Admin::PrayerVigils", type: :request do
  before do
    login_as(create(:user, :admin))
  end

  describe "GET /index" do
    it "returns http success" do
      get admin_prayer_vigils_path
      expect(response).to have_http_status(:success)
    end
  end
end
