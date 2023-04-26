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

  describe "PATCH /admin/events" do
    context "with valid parameters" do
      let(:event) { create(:event, :weekend) }

      it "updates the requested event" do
        patch admin_event_path(event), params: { event: { name: "name" } }
        event.reload
        expect(event.name).to eq("name")
      end

      it "redirects to the event" do
        patch admin_event_path(event), params: { event: { name: "name" } }
        event.reload
        expect(response).to redirect_to(admin_event_path(event))
      end
    end

    context "with invalid parameters" do
      let(:event) { create(:event, :weekend) }

      it "renders a successful response (i.e. to display the 'edit' template)" do
        patch admin_event_path(event), params: { event: { name: "" } }
        event.reload
        expect(response).to be_unprocessable
      end
    end

    # add create
    # check other event creation
  end
end

