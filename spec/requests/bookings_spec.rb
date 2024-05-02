require 'rails_helper'

RSpec.describe "Bookings", type: :request do
  describe "GET /new" do
    it "returns http success" do
      get new_prayer_vigil_booking_path(create(:prayer_vigil))
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /get_slots" do
    let(:prayer_vigil) { create(:prayer_vigil) }
    let(:date) { Date.today }

    before do
      # Create some slots for the specified date
      create_list(:prayer_slot, 3, prayer_vigil: prayer_vigil, start_time: date.to_time)
    end

    it "returns http success" do
      get signups_get_slots_prayer_vigil_path(prayer_vigil, date: date), as: :turbo_stream
      expect(response).to have_http_status(:success)
    end

    it "returns the correct slots" do
      get signups_get_slots_prayer_vigil_path(prayer_vigil, date: date), as: :turbo_stream
      expect(response.body).to include('turbo-stream')
      prayer_vigil.prayer_slots.on_date(date).each do |slot|
        expect(response.body).to include(slot.start_time.strftime('%I:%M %p'))
      end
    end
  end

end
