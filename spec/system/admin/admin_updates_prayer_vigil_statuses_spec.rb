require 'system_helper'

RSpec.describe "Admin::UpdatesPrayerVigilStatuses", type: :system do
  before do
    login_as create(:user, :super_admin)
    @prayer_vigil = create(:prayer_vigil)
    visit admin_prayer_vigils_path
  end

  describe "admin updates prayer vigil status" do
    it "updates the prayer vigil status" do
      within "#{dom_id(@prayer_vigil, :activate)}" do
        find(".capitalize").click
      end

      expect(page).to have_content("Prayer Vigil status was successfully updated.")
    end
  end
end
