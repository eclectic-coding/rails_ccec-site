require "system_helper"

RSpec.describe "Admin::EventDeletes", type: :system do
  before do
    login_as create(:user, :super_admin)
    create(:event, :weekend) # Create a weekend event
    visit admin_events_path
  end

  describe "deletes all weekend events when deleting the weekend" do
    it "deletes an event" do
      expect(page).to have_selector("tbody tr", count: 4, wait: 10) # Wait up to 10 seconds for the element to appear
      first('button[data-confirm="Are you sure?"]').click

      expect(page).to have_css("tbody tr", count: 1, wait: 10) # Wait up to 10 seconds for the element to appear
    end
  end

  describe "deletes one events" do
    it "deletes an event" do
      expect(page).to have_selector("tbody tr", count: 4, wait: 10) # Wait up to 10 seconds for the element to appear
      all('button[data-confirm="Are you sure?"]').last.click

      expect(page).to have_css("tbody tr", count: 3, wait: 10) # Wait up to 10 seconds for the element to appear
    end
  end
end
