require 'system_helper'

RSpec.describe "Admin::DestroyBookings", type: :system do
  before do
    login_as(create(:user, :admin))
  end

  describe 'destroying a booking' do
    let(:event) { create(:event, :weekend, start_time: Time.now) }
    let(:prayer_vigil) { PrayerVigil.find_by(walk_number: event.walk_number) }

    it 'destroys the booking' do
      booking = create(:booking, prayer_vigil: prayer_vigil, prayer_slot: prayer_vigil.prayer_slots.first)
      slot = prayer_vigil.prayer_slots.first

      visit admin_prayer_vigil_path(prayer_vigil)
      expect(page).to have_content(booking.email)

      accept_confirm do
        click_on 'Remove'
      end

      expect(page).to have_content('Reservation was successfully removed and the user has been notified.')
      expect(page).not_to have_content(booking.email)
      expect(slot.reload.active?).to be_truthy
    end
  end
end
