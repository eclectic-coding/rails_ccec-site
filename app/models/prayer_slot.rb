# == Schema Information
#
# Table name: prayer_slots
#
#  id              :bigint           not null, primary key
#  start_time      :datetime
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  prayer_vigil_id :bigint           not null
#
# Indexes
#
#  index_prayer_slots_on_prayer_vigil_id  (prayer_vigil_id)
#
# Foreign Keys
#
#  fk_rails_...  (prayer_vigil_id => prayer_vigils.id)
#
class PrayerSlot < ApplicationRecord
  belongs_to :prayer_vigil
  has_many :bookings, dependent: :destroy
  has_many :poly_actives, as: :activatable, dependent: :destroy

  after_create { PolyActive.create!(activatable: self) }

  scope :active_slots, -> { joins(:poly_actives).where(poly_actives: { active: true }).order(start_time: :asc) }
  scope :on_date, ->(date) { where(start_time: date.beginning_of_day..date.end_of_day) }


  def active?
    poly_actives.first&.active
  end
end
