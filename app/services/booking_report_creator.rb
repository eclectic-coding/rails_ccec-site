# frozen_string_literal: true

class BookingReportCreator
  def initialize(collection)
    @collection = collection
    to_csv(@collection)
  end

  def to_csv(collection)
    headers = %w[Name Email Walk Date Slot]
    CSV.generate(headers: true) do |csv|
      csv << headers
      collection.each do |booking|
        csv << [booking.name, booking.email, booking.prayer_vigil.walk_number,
                booking.prayer_slot.start_time.strftime('%b %d'), booking.prayer_slot.start_time.strftime('%I:%M %p')]
      end
    end
  end
end
