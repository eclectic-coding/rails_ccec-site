# frozen_string_literal: true

class Event::TimeBannerComponent < ViewComponent::Base
  attr_reader :event

  def initialize(event:)
    @event = event
  end
end
