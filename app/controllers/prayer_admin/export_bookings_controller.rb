class PrayerAdmin::ExportBookingsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_prayer_vigil, only: %i[index]

  def index
    @bookings = Booking.by_prayer_vigil(@prayer_vigil)

    respond_to do |format|
      format.html
      format.csv do
        report = BookingReportCreator.new(@bookings.to_a)
        send_data report.csv_data, filename: "prayer_vigil_#{params[:id]}_bookings.csv"
      end
    end
  end

  private

  def set_prayer_vigil
    @prayer_vigil = PrayerVigil.friendly.find(params[:id])
  end
end
