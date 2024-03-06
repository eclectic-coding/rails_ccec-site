# frozen_string_literal: true

class Event::TimeBannerComponent < ApplicationViewComponent
  option :event

  def multi_day_event
    "#{event.start_time.strftime("%b %d")} - #{event.end_time.strftime("%b %d")}"
  end

  def single_day_event
    "#{event.start_time.strftime("%b %d")} @ #{event.start_time.strftime("%l:%M %p")}"
  end
end
