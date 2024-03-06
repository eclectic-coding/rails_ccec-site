# frozen_string_literal: true

class Event::EventComponent < ApplicationViewComponent
  attr_reader :event

  def initialize(event:)
    @event = event
  end
end
