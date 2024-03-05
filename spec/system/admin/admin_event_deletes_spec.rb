require "system_helper"

RSpec.describe "Admin::EventDeletes", type: :system do
  let!(:event){create(:event, :weekend)}

  before do
    login_as create(:user, :super_admin)
    visit admin_events_path
  end

  describe "deletes all weekend events when deleting the weekend" do
    it "deletes an event" do
      expect(page).to have_selector("tbody tr", count: 4)
      first('button[data-confirm="Are you sure?"]').click

      expect(page).to have_css("tbody tr", count: 1)
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
