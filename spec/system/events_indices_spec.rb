require "system_helper"

RSpec.describe "EventsIndices", type: :system do
  before do
    create(:event, event_type: :weekend, name: "Weekend", walk_number: 1, start_time: Time.zone.now, role: "")
    visit events_path
  end

  describe "displays events index" do
    xit "renders only public events" do
      expect(page).to have_selector("tbody tr", count: 1)
    end
  end
end
