require 'rails_helper'

RSpec.describe "Admin::ExportBookings", type: :request do
  before do
    login_as(create(:user, :admin))
  end

  describe "GET /index" do
    it "returns http success" do
      get admin_export_bookings_path
      expect(response).to have_http_status(:success)
    end
  end

end
