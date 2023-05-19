# == Schema Information
#
# Table name: events
#
#  id                 :uuid             not null, primary key
#  end_time           :datetime
#  event_type         :integer
#  name               :string
#  role               :string
#  start_time         :datetime
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  connected_event_id :string
#
class Event < ApplicationRecord
  after_create :set_endtime, if: :weekend?
  after_create :create_weekend_events, if: :weekend?

  validates :name, :start_time, :event_type, presence: true

  enum :event_type, {
    weekend: 0,
    followup: 1,
    gathering: 2,
    prayer_vigil: 3,
    sendoff: 4,
    candlelight: 5,
    closing: 6
  }

  def weekend?
    event_type == "weekend"
  end

  def set_endtime
    update(end_time: start_time + 72.hours)
  end

  def create_weekend_events
    Event.create(
      name: "Sendoff",
      start_time: start_time,
      role: "member",
      event_type: :sendoff,
      connected_event_id: id
    )
    Event.create(
      name: "Candlelight",
      start_time: start_time + 48.hours,
      role: "member",
      event_type: :candlelight,
      connected_event_id: id
    )
    Event.create(
      name: "Closing",
      start_time: start_time + 72.hours,
      event_type: :closing,
      connected_event_id: id
    )
  end
end
