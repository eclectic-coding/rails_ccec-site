# frozen_string_literal: true

class EventDecorator < SimpleDelegator
  def event_title
    (event_type == "weekend") ? "#{name} #{walk_number}" : name
  end
end
