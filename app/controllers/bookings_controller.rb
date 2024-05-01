class BookingsController < ApplicationController
  before_action :set_prayer_vigil

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)

    if @booking.save
      # TODO: Update time_slot to be inactive
      # TODO: send email to user
      redirect_to prayer_vigils_path, notice: 'Slot booked successfully'
    else
      render :new
    end

  end

  private

  def set_prayer_vigil
    @prayer_vigil = PrayerVigil.find(params[:prayer_vigil_id])
    available_slots = @prayer_vigil.prayer_slots.active_slots
    @grouped_slots = available_slots.group_by { |slot| slot.start_time.to_date }
  end

  def booking_params
    params.require(:booking).permit(:prayer_slot_id)
  end
end
