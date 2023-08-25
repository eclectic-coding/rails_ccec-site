require "rails_helper"

RSpec.describe "Admin::Addresses", type: :request do
  before do
    login_as(create(:user, :admin))
  end

  describe "GET /index" do
    it "returns http success" do
      get admin_addresses_path
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /show" do
    it "returns http success" do
      event = create(:event, :weekend)
      location = create(:address, event: event)
      get admin_address_path(location)
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /new" do
    it "returns http success" do
      get new_admin_address_path
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /edit" do
    it "returns http success" do
      get edit_admin_address_path
      expect(response).to have_http_status(:success)
    end
  end
end
