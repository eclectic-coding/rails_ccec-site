# frozen_string_literal: true

class Footer::EventsComponent < ViewComponent::Base
  attr_reader :events

  def initialize(events:)
    @events = events
  end
end
