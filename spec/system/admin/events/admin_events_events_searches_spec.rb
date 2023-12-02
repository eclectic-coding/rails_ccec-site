require "rails_helper"

RSpec.describe "Admin::Events::EventsSearches", type: :system do
  before do
    login_as create(:user, :admin)
    create(:event, name: "Weekend Event", event_type: "weekend", walk_number: 111, start_time: Time.zone.now + 1.day)
  end

  describe "searching", js: true do
    it "searches by name" do
      visit admin_events_path
      expect(page).to have_selector("tbody tr", count: 4)

      fill_in "search", with: "111"
      expect(page).to have_selector("tbody tr", count: 1)
    end
  end
end
