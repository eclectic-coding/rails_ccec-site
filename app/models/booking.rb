# == Schema Information
#
# Table name: bookings
#
#  id              :bigint           not null, primary key
#  email           :string
#  first_name      :string
#  last_name       :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  prayer_slot_id  :bigint           not null
#  prayer_vigil_id :bigint           not null
#
# Indexes
#
#  index_bookings_on_prayer_slot_id   (prayer_slot_id)
#  index_bookings_on_prayer_vigil_id  (prayer_vigil_id)
#
# Foreign Keys
#
#  fk_rails_...  (prayer_slot_id => prayer_slots.id)
#  fk_rails_...  (prayer_vigil_id => prayer_vigils.id)
#
class Booking < ApplicationRecord
  belongs_to :prayer_vigil
  belongs_to :prayer_slot

  has_person_name

  validates :first_name, :last_name, :email, presence: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }

  after_save :deactivate_prayer_slot

  scope :by_prayer_vigil, ->(prayer_vigil_id) {
    includes(:prayer_vigil).includes(:prayer_slot)
      .where(prayer_vigil_id: prayer_vigil_id).order('prayer_slots.start_time')
  }

  def deactivate_prayer_slot
    prayer_slot = PrayerSlot.find(self.prayer_slot_id)
    prayer_slot.poly_actives.first.toggle!(:active)
  end
end
