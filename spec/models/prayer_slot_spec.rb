require 'rails_helper'

RSpec.describe PrayerSlot, type: :model do
  describe '#active?' do
    let(:prayer_vigil) { create(:prayer_vigil) }
    let(:prayer_slot) { prayer_vigil.prayer_slots.first }

    context 'when the prayer slot is active' do
      it 'returns true' do
        expect(prayer_slot.active?).to be true
      end
    end

    context 'when the prayer slot is not active' do
      it 'returns false' do
        prayer_slot.toggle_active!
        expect(prayer_slot.active?).to be false
      end
    end
  end
end
