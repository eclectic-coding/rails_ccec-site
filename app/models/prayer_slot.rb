# == Schema Information
#
# Table name: prayer_slots
#
#  id              :bigint           not null, primary key
#  end_time        :datetime
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
end
