require "system_helper"

RSpec.describe "AdminEventsFilters", type: :system do
  let!(:event){ create(:event, name: "Walk 1", event_type: :weekend, start_time: Time.zone.now + 1.day) }
  before do
    login_as create(:user, :super_admin)
    visit admin_events_path
  end

  describe "filtering events" do
    it "filters events by weekend event type" do
      select "Weekend", from: "event_type"

      within "tbody tr:nth-child(1)" do
        expect(page).to have_text "Weekend"
      end
    end

    it "filters events by sendoff event type" do
      select "Sendoff", from: "event_type"

      within "tbody tr:nth-child(1)" do
        expect(page).to have_text "Sendoff"
      end
    end

    it "filters events by candlelight event type" do
      select "Candlelight", from: "event_type"

      within "tbody tr:nth-child(1)" do
        expect(page).to have_text "Candlelight"
      end
    end

    it "filters events by closing event type" do
      select "Closing", from: "event_type"

      within "tbody tr:nth-child(1)" do
        expect(page).to have_text "Closing"
      end
    end

    it "filters events by follow up event type" do
      create(:event, event_type: :followup)
      select "Followup", from: "event_type"

      within "tbody tr:nth-child(1)" do
        expect(page).to have_text "Followup"
      end
    end

    it "filters events by gathering event type" do
      create(:event, event_type: :gathering)
      select "Gathering", from: "event_type"

      within "tbody tr:nth-child(1)" do
        expect(page).to have_text "Gathering"
      end
    end

    it "reset event filtering" do
      select "Weekend", from: "event_type"
      select "Filter by Event type", from: "event_type"
      expect(all("tbody tr").count).to eq(4)
    end
  end
end
