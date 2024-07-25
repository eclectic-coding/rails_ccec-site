require 'system_helper'

RSpec.describe "PrayerAdmin::DestroyBookings", type: :system do

  describe 'destroy booking' do
    before do
      login_as(create(:user, :admin))
      @event = create(:event, :weekend)
      @prayer_vigil = PrayerVigil.find_by(walk_number: @event.walk_number)
      @prayer_slot = PrayerSlot.find_by(prayer_vigil_id: @prayer_vigil.id)
      @booking = create(:booking, prayer_vigil_id: @prayer_vigil.id, prayer_slot_id: @prayer_slot.id)
    end

    it 'destroys booking' do
      visit prayer_admin_prayer_vigil_path(@prayer_vigil)

      expect(page).to have_content(@booking.full_name)

      accept_confirm do
        click_on 'Remove'
      end

      expect(page).to have_content('Reservation was successfully removed and the user has been notified.')
      expect(page).not_to have_content(@booking.full_name)
    end
  end
end
