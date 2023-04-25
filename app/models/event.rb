# == Schema Information
#
# Table name: events
#
#  id         :uuid             not null, primary key
#  end_time   :datetime
#  name       :string
#  recurring  :text
#  role       :string
#  start_time :datetime
#  type       :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Event < ApplicationRecord
  enum :type, {
    weekend: 0,
    followup: 1,
    gathering: 2,
    prayer_vigil: 3,
    sendoff: 4,
    candlelight: 5,
    closing: 6
  }
end
