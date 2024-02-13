# == Schema Information
#
# Table name: events
#
#  id                 :uuid             not null, primary key
#  description        :text
#  end_time           :datetime
#  event_type         :integer
#  name               :string
#  role               :string
#  start_time         :datetime
#  walk_number        :integer
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  address_id         :uuid
#  connected_event_id :string
#
# Indexes
#
#  index_events_on_address_id  (address_id)
#
# Foreign Keys
#
#  fk_rails_...  (address_id => addresses.id)
#
class Event < ApplicationRecord
  belongs_to :address, optional: true

  after_create do
    update(end_time: start_time + 72.hours) if weekend?
    WeekendEventCreator.new(self).call if weekend?
  end

  after_destroy do
    Event.where(walk_number: walk_number).where.not(walk_number: [nil, ""]).destroy_all
  end

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

  scope :after_today, -> { includes(:address).where("start_time >= ?", Time.zone.now).order(start_time: :asc) }
  scope :after_today_footer, -> { where("start_time >= ?", Time.zone.now).order(start_time: :asc) }
  scope :by_name, ->(query) { where("name ILIKE ?", "%#{query}%") }
  scope :by_event_type, ->(event_type) { where(event_type: event_type) if event_type.present? }
  scope :admin_view, -> { includes(:address).where("start_time >= ?", Time.zone.now - 14.days).order(start_time: :asc) }

  def weekend?
    event_type == "weekend"
  end

  def self.filter(filters)
    Event.by_name(filters["search"])
      .by_event_type(filters["event_type"])
      .order("#{filters["column"]} #{filters["direction"]}")
  end

  def event_title
    (event_type == "weekend") ? "#{name} #{walk_number}" : name
  end
end
