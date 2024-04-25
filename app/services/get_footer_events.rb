# frozen_string_literal: true

class GetFooterEvents
  def call
    @events = Event.includes(:address)
  end
end
