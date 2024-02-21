require "rails_helper"

RSpec.describe "Events", type: :request do
  describe "GET /events" do
    it "renders a successful response" do
      get events_path
      expect(response).to have_http_status(200)
    end
  end

  describe "GET /events/:id" do
    it "renders a successful response" do
      create(:address, name: "Salt and Light Center")
      create(:address, name: "Faith Harbor UMC")
      event = create(:event, :weekend)
      get event_path(event)
      expect(response).to have_http_status(200)
    end
  end
end
