# == Schema Information
#
# Table name: prayer_vigils
#
#  id          :bigint           not null, primary key
#  end_time    :datetime
#  start_time  :datetime
#  title       :string
#  walk_number :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class PrayerVigil < ApplicationRecord
  has_many :prayer_slots, dependent: :destroy
  has_many :bookings, dependent: :destroy
  has_many :poly_actives, as: :activatable, dependent: :destroy

  after_create { PolyActive.create!(activatable: self) }
  after_create :generate_slots

  scope :active, -> { joins(:poly_actives).where(poly_actives: { active: true }) }

  def generate_slots
    PrayerSlot.create(
      start_time: start_time,
      prayer_vigil: self)
    starttime = start_time
    71.times do |n|
      PrayerSlot.create!(start_time: starttime + n.hour, prayer_vigil: self)
    end
  end

  def active?
    poly_actives.first&.active
  end
end
