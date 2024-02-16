# frozen_string_literal: true

class EventDecorator < SimpleDelegator
  def self.decorate_collection(collection)
    collection.map { |event| new(event) }
  end

  def event_title
    (event_type == "weekend") ? "#{name} #{walk_number}" : name
  end
end
