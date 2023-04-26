require "rails_helper"

RSpec.describe "Events", type: :request do
  before do
    @admin_user = create(:user, :super_admin)
    sign_in @admin_user
  end

  describe "GET /admin/events" do
    it "renders successful response" do
      create(:event, :weekend)
      get admin_events_path
      expect(response).to have_http_status(200)
    end
  end

  describe "GET /admin/events/:id" do
    it "renders successful response" do
      event = create(:event, :weekend)
      get admin_event_path(event)
      expect(response).to have_http_status(200)
    end
  end

  describe "GET /admin/events/:id/edit" do
    it "renders successful response" do
      event = create(:event, :weekend)
      get edit_admin_event_path(event)
      expect(response).to have_http_status(200)
    end
  end
end

