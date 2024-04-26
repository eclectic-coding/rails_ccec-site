# frozen_string_literal: true

class EventDecorator < SimpleDelegator
  def self.decorate_collection(collection)
    collection.map { |event| new(event) }
  end

  def event_title
    (event_type == 'weekend') ? "#{name} #{walk_number}" : name
  end

  def event_date_header
    start_time.strftime('%A, %B %e, %Y')
  end

  def event_date
    start_time.strftime('%A, %B %e, %Y')
  end

  def event_address
    "#{address.city}, #{address.state}"
  end

  def map_link
    "https://www.google.com/maps/@#{address&.latitude},#{address&.longitude},15z?hl=en-US&entry=ttu"
  end
end
