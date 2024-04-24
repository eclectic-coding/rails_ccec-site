# frozen_string_literal: true

class Event::Address::Component < ApplicationViewComponent
  option :event

  def venue_name
    "#{event&.address&.name}, " if event&.address&.name.present?
  end

  def venue_address
    "#{event.address&.city}, #{event.address&.state}" if event.address&.name.present?
  end
end
