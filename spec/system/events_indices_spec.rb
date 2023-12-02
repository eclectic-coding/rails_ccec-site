require "rails_helper"

RSpec.describe "EventsIndices", type: :system do
  before do
    @event = create(:event, event_type: :weekend, name: "Weekend", walk_number: 1, start_time: Time.zone.now + 7.days, role: "")
    visit events_path
  end

  describe "displays events index" do
    it "renders only public events" do
      expect(page).to have_selector("[data-test-event='true']", count: 1)
    end

    it "renders all events for members" do
      login_as create(:user, :member)
      expect(page).to have_selector("[data-test-event='true']", count: 1)
    end
  end

  describe "renders show" do
    it "renders event" do
      visit event_path(@event)
      expect(page).to have_text "Weekend"
    end
  end
end
