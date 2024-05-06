require 'rails_helper'

RSpec.describe "Admin::ExportBookings", type: :request do
  before do
    login_as(create(:user, :admin))
  end

  describe "GET /index" do
    it "returns http success" do
      get admin_export_bookings_path(id: create(:prayer_vigil).id, format: :csv)
      expect(response).to have_http_status(:success)
    end
  end

end
