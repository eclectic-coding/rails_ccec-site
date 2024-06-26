class BookingsController < ApplicationController
  before_action :set_prayer_vigil, only: [:new, :create, :get_slots]

  def new
    @booking = Booking.new
  end

  def create
    @prayer_vigil = PrayerVigil.friendly.find(params[:booking][:prayer_vigil_id])
    @booking = @prayer_vigil.bookings.new(booking_params.except(:day, :prayer_vigil_id))

    if @booking.save!
      BookingMailer.booking_confirmation(@booking).deliver_now
      redirect_to prayer_vigils_path, notice: t('.success')
    else
      render :new
    end
  end

  def get_slots
    date = Date.parse(params[:date].to_s)
    @get_slots = @available_slots.on_date(date).map { |slot| [slot.start_time.strftime('%I:%M %p'), slot.id] }

    respond_to do |format|
      format.turbo_stream {
        render turbo_stream: turbo_stream.update(
          'times-select',
          partial: 'bookings/get_slots',
          locals: { get_slots: @get_slots })
      }
    end
  end

  private

  def set_prayer_vigil
    @prayer_vigil = PrayerVigil.friendly.find(params[:prayer_vigil_id] || params[:id])
    @available_slots = @prayer_vigil.prayer_slots.active_slots
    @grouped_slots = @available_slots.group_by { |slot| slot.start_time.to_date }
  end

  def booking_params
    params.require(:booking).permit(:name, :email, :day, :prayer_slot_id, :prayer_vigil_id)
  end
end
