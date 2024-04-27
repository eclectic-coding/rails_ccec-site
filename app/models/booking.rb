# == Schema Information
#
# Table name: bookings
#
#  id              :bigint           not null, primary key
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
end
