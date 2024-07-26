require "system_helper"

RSpec.describe "AdminEventsIndices", type: :system do
  before do
    login_as create(:user, :super_admin)
    create_list(:event, 12, :follow_up)
    visit admin_events_path
  end

  describe "displays admin index path" do
    it "renders successful response" do
      expect(page).to have_current_path(admin_events_path, ignore_query: true)
    end

    it "renders pagination" do
      expect(page).to have_selector("nav.pagy", wait: 10) # Wait up to 10 seconds for the element to appear
    end

    xit "renders pagination and advances to page 2" do
      expect(page).to have_selector("nav.pagy", wait: 10) # Wait up to 10 seconds for the element to appear

      click_link "2"
      expect(page).to have_selector("tbody tr", count: 2, wait: 10) # Wait up to 10 seconds for the element to appear
    end
  end
end
