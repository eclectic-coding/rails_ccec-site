# app/services/weekend_event_creator.rb
class WeekendEventCreator
  def initialize(event)
    @event = event
  end

  def call
    return unless @event.weekend?

    create_sendoff
    create_candlelight
    create_closing
  end

  private

  def set_member_role
    "member"
  end

  def create_sendoff
    Event.create(
      name: "Sendoff",
      start_time: @event.start_time + 0.5.hours,
      role: set_member_role,
      event_type: :sendoff,
      connected_event_id: @event.id,
      walk_number: @event.walk_number,
      description: "Sendoff will be held at the Salt and Light Center following registration",
      address_id: Address.find_by(name: "Salt and Light Center").id
    )
  end

  def create_candlelight
    Event.create(
      name: "Candlelight",
      start_time: @event.start_time + 48.5.hours,
      role: set_member_role,
      event_type: :candlelight,
      connected_event_id: @event.id,
      walk_number: @event.walk_number,
      description: "Candlelight worship starts at 7:00pm and the pilgrims will arrive at 9:00pm",
      address_id: Address.find_by(name: "Faith Harbor UMC").id
    )
  end

  def create_closing
    Event.create(
      name: "Closing",
      start_time: @event.start_time + 70.hours,
      role: set_member_role,
      event_type: :closing,
      connected_event_id: @event.id,
      walk_number: @event.walk_number,
      description: "Closing will be held at location date time",
      address_id: Address.find_by(name: "Faith Harbor UMC").id
    )
  end
end
