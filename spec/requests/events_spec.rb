require "rails_helper"

RSpec.describe "Events", type: :request do
  describe "GET /events" do
    context "when logged in as an user" do
      before do
        login_as(create(:user))
      end

      it "renders a successful response" do
        get events_path
        expect(response).to have_http_status(:ok)
      end

      it "user can view all events" do
        create(:event, :weekend)
        get events_path
        expect(Event.count).to eq(4)
      end
    end

    context "when not logged in (guest)" do
      it "renders a successful response" do
        get events_path
        expect(response).to have_http_status(:ok)
      end

      it "guest can view all events" do
        create(:event, :weekend)
        get events_path
        expect(Event.count).to eq(4)
      end
    end
  end

  describe "GET /events/:id" do
    it "renders a successful response" do
      event = create(:event, :weekend)
      get event_path(event)
      expect(response).to have_http_status(:ok)
    end
  end
end
