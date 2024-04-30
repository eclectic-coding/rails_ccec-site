require 'rails_helper'

RSpec.describe "Bookings", type: :request do
  describe "GET /new" do
    it "returns http success" do
      get new_prayer_vigil_booking_path(create(:prayer_vigil))
      expect(response).to have_http_status(:success)
    end
  end
end
