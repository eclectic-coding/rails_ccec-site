# frozen_string_literal: true

class Event::AddressComponent < ViewComponent::Base
  attr_reader :event

  def initialize(event:)
    @event = event
  end

  def venue_name
    "#{event.address&.name}, " if event.address.present?
  end

  def venue_address
    "#{event.address&.city}, #{event.address&.state}" if event.address&.name.present?
  end
end
