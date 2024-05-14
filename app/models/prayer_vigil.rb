# == Schema Information
#
# Table name: prayer_vigils
#
#  id          :bigint           not null, primary key
#  end_time    :datetime
#  slug        :string
#  start_time  :datetime
#  title       :string
#  walk_number :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
# Indexes
#
#  index_prayer_vigils_on_slug  (slug) UNIQUE
#
class PrayerVigil < ApplicationRecord
  extend FriendlyId
  friendly_id :walk_title, use: :slugged

  has_many :prayer_slots, dependent: :destroy
  has_many :bookings, dependent: :destroy
  has_many :poly_actives, as: :activatable, dependent: :destroy

  after_create { PolyActive.create!(activatable: self) }
  after_create :generate_slots

  scope :active, -> { joins(:poly_actives).where(poly_actives: { active: true }) }

  def generate_slots
    starttime = start_time
    72.times do |n|
      PrayerSlot.create!(start_time: starttime + n.hour, prayer_vigil: self)
    end
  end

  def walk_title
    "walk-#{walk_number}"
  end

  def active?
    poly_actives.first&.active
  end

  def toggle_active!
    poly_actives.first.toggle!(:active)
  end
end
