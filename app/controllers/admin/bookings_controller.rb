class Admin::BookingsController < ApplicationController
  before_action :authenticate_user!
  set :booking, only: %i[destroy]

  layout 'admin'

  def destroy
    @booking.destroy
    @slot.toggle_active! # active booking prayer_slot
    BookingMailer.booking_canceled(@booking).deliver_now # email user that booking has been cancelled

    redirect_to admin_prayer_vigil_path(@prayer_vigil), notice: t('.destroy_notice')
  end

  private

  def set_booking
    @booking = Booking.find(params[:id])
    @slot = @booking.prayer_slot
    @prayer_vigil = @booking.prayer_vigil
  end
end
