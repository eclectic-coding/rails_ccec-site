require "system_helper"

RSpec.describe "Admin::Events::EventsIndices", type: :system do
  let!(:event) { create(:event, event_type: :weekend, name: "Weekend", walk_number: 1, start_time: Time.zone.now, role: "") }

  before do
    login_as create(:user, :admin)
    visit admin_events_path
  end

  describe "GET /admin/events" do
    it "displays the events index" do
      within "tbody tr:nth-child(1) td:nth-child(5)" do
        expect(page).to have_text Time.zone.now.strftime("%m-%d-%Y")
      end
    end
  end

  describe "sort by name column" do
    it "sorts ascending and descending" do
      click_link "Name"
      within "tbody tr:nth-child(1)" do
        expect(page).to have_text "Candlelight"
      end

      # save_and_open_page
      find("a", text: "Name", visible: false).click
      within "tbody tr:nth-child(1)" do
        expect(page).to have_text "Weekend 1"
      end
    end
  end

  describe "sort by walk column" do
    it "sorts ascending" do
      within "tbody tr:nth-child(1) td:nth-child(2)" do
        expect(page).to have_text "1"
      end
    end

    it "sorts descending" do
      create(:event, event_type: 2, name: "Gathering")
      find("a", text: "Walk", visible: false).click
      find("a", text: "Walk", visible: false).click

      within "tbody tr:nth-child(1) td:nth-child(2)" do
        expect(page).to have_text ""
      end
    end
  end

  describe "sort by start_time column" do
    it "sorts ascending" do
      click_link "Start Time"

      within "tbody tr:nth-child(1)" do
        expect(page).to have_text Time.zone.now.strftime("%m-%d-%Y")
      end
    end

    it "sorts descending" do
      event = create(:event, event_type: 2, name: "Gathering", start_time: Time.zone.now + 30.days)
      find("a", text: "Start Time", visible: false).click
      find("a", text: "Start Time", visible: false).click

      within "tbody tr:nth-child(1)" do
        expect(page).to have_text(event.start_time.strftime("%m-%d-%Y"))
      end
    end
  end

  describe "sort by type column" do
    it "sorts ascending" do
      within "tbody tr:nth-child(1)" do
        expect(page).to have_text "Weekend"
      end
    end

    it "sorts descending" do
      create(:event, event_type: 2, name: "Gathering")
      find("a", text: "Type", visible: false).click
      within "tbody tr:nth-child(1)" do
        expect(page).to have_text "Weekend 1"
      end

      find("a", text: "Type", visible: false).click
      within "tbody tr:nth-child(1)" do
        expect(page).to have_text "Closing"
      end
    end
  end
end
