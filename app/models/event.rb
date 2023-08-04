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
#  walk_number        :integer
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

  FILTER_PARAMS = %w[search name event_type column direction].freeze

  scope :by_name, ->(query) { where("name ILIKE ?", "%#{query}%") }
  scope :by_event_type, ->(event_type) { where(event_type: event_type) }

  def self.filter(filters)
    Event.by_name(filters["search"])
      .order("#{filters["column"]} #{filters["direction"]}")
  end

  def weekend?
    event_type == "weekend"
  end

  def set_endtime
    update(end_time: start_time + 72.hours)
  end

  def event_title
    (event_type == "weekend") ? "#{name} #{walk_number}" : name
  end

  def create_weekend_events
    create_sendoff
    create_candlelight
    create_closing
  end

  def create_sendoff
    Event.create(
      name: "Sendoff",
      start_time: start_time,
      role: "member",
      event_type: :sendoff,
      connected_event_id: id,
      walk_number: walk_number
    )
  end

  def create_candlelight
    Event.create(
      name: "Candlelight",
      start_time: start_time + 48.hours,
      role: "member",
      event_type: :candlelight,
      connected_event_id: id,
      walk_number: walk_number
    )
  end

  def create_closing
    Event.create(
      name: "Closing",
      start_time: start_time + 72.hours,
      role: "member",
      event_type: :closing,
      connected_event_id: id,
      walk_number: walk_number
    )
  end
end
