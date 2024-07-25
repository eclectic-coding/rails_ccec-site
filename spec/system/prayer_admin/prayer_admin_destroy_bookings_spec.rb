require 'system_helper'

RSpec.describe "PrayerAdmin::DestroyBookings", type: :system do

  describe 'destroy booking' do
    let(:event) { create(:event, :weekend) }
    let(:prayer_vigil) { PrayerVigil.find_by(walk_number: event.walk_number) }
    let(:prayer_slot) { PrayerSlot.find_by(prayer_vigil_id: prayer_vigil.id) }
    let(:booking) { create(:booking, prayer_vigil_id: prayer_vigil.id, prayer_slot_id: prayer_slot.id) }

    it 'destroys booking' do
      login_as(create(:user, :prayer))
      visit prayer_admin_prayer_vigils_path
      take_screenshot

      expect(page).to have_content(booking.user.full_name)

      accept_confirm do
        click_on 'Remove'
      end

      expect(page).to have_content('Booking has been cancelled')
      expect(page).not_to have_content(booking.user.full_name)
    end
  end
end
