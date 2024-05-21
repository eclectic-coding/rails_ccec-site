require 'rails_helper'

RSpec.describe "PrayerAdmin::PrayerVigils", type: :request do
  describe "GET /index" do
    it "returns http success" do
      login_as(create(:user, :prayer))
      get prayer_admin_prayer_vigils_path
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /show" do
    before do
      login_as(create(:user, :super_admin))
    end

    let(:event) { create(:event, :weekend, start_time: Time.now) }
    let(:prayer_vigil) { PrayerVigil.find_by(walk_number: event.walk_number) }

    it "returns http success" do
      get prayer_admin_prayer_vigil_path(prayer_vigil)
      expect(response).to have_http_status(:success)
    end
  end
end
