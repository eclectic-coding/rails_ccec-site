class Admin::PrayerVigilsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_prayer_vigil, only: %i[show export_prayer_vigil]

  layout 'admin'

  def index
    @pagy, @prayer_vigils = pagy(PrayerVigil.all, items: 10)
  end

  def show
    @walk_number = @prayer_vigil.walk_number
    @bookings = Booking.by_prayer_vigil(PrayerVigil.find(params[:id]))
  end

  def export_prayer_vigil
    @bookings = Booking.by_prayer_vigil(@prayer_vigil.id)

    respond_to do |format|
      format.html
      format.csv do
        send_data Booking.to_csv(@bookings), filename: "prayer_vigil_#{params[:id]}_bookings.csv"
      end
    end
  end

  private

  def set_prayer_vigil
    @prayer_vigil = PrayerVigil.find(params[:id])
  end
end
