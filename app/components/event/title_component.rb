# frozen_string_literal: true

class Event::TitleComponent < ViewComponent::Base
  attr_reader :event

  def initialize(event:)
    @event = event
  end

  def title
    if event.event_type == "weekend"
      event.name + " #{event.walk_number}"
    else
      event.name
    end
  end
end
