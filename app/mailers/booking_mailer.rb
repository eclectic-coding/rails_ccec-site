class BookingMailer < ApplicationMailer
  def booking_confirmation
    @booking = params[:booking]
    mail(to: @booking.email, subject: t('.booking_confirmation', walk_number: @booking.prayer_vigil.walk_number))
  end
end
