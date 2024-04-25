# frozen_string_literal: true

class Event::Title::Component < ApplicationViewComponent
  option :event

  def title
    if event.event_type == 'weekend'
      event.name + " #{event.walk_number}"
    else
      event.name
    end
  end
end
