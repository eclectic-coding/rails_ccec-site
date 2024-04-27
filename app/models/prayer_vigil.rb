# == Schema Information
#
# Table name: prayer_vigils
#
#  id         :bigint           not null, primary key
#  end_time   :datetime
#  start_time :datetime
#  title      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class PrayerVigil < ApplicationRecord
end
