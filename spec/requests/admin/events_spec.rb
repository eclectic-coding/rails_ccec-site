require "rails_helper"

RSpec.describe "Admin::Events", type: :request do
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

  describe "GET /admin/events/new" do
    it "renders successful response" do
      get new_admin_event_path
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
        expect(response).to redirect_to(admin_events_path)
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

    describe "CREATE /admin/events" do
      context "with valid parameters" do
        it "creates an event" do
          expect do
            post admin_events_path, params: {
              event: { name: "name", event_type: :weekend, start_time: Time.zone.now }
            }
          end.to change(Event, :count).by(4)
        end

        it "new weekend created sendoff event" do
          create(:event, :weekend)
          sendoff = Event.find_by(event_type: :sendoff)
          expect(sendoff.role).to eq("member")
          expect(sendoff).to be_present
        end

        it "new weekend created candlelight event" do
          create(:event, :weekend)
          candlelight = Event.find_by(event_type: :candlelight)
          expect(candlelight.role).to eq("member")
          expect(candlelight).to be_present
        end

        it "new weekend created closing event" do
          create(:event, :weekend)
          closing = Event.find_by(event_type: :closing)
          expect(closing).to be_present
        end

        it "redirects to the admin events index" do
          post admin_events_path, params: {
            event: { name: "name", event_type: :weekend, start_time: Time.zone.now }
          }
          expect(response).to redirect_to(admin_events_path)
        end
      end

      context "with invalid parameters" do
        it "does not create an event" do
          expect do
            post admin_events_path, params: {
              event: { name: "", event_type: :weekend, start_time: Time.zone.now }
            }
          end.to change(Event, :count).by(0)
        end

        it "renders a successful response (i.e. to display the 'new' template)" do
          post admin_events_path, params: {
            event: { name: "", event_type: :weekend, start_time: Time.zone.now }
          }
          expect(response).to be_unprocessable
        end
      end
    end

    describe "DELETE " do
      it "destroys an event" do
        event = create(:event, :weekend)
        expect do
          delete admin_event_path(event)
        end.to change(Event, :count).by(-4)
      end

      it "redirects to the events list" do
        event = create(:event, :weekend)
        delete admin_event_path(event)
        expect(response).to redirect_to(admin_events_path)
      end
    end
  end
end
