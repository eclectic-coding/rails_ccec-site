class Admin::PrayerVigilsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_prayer_vigil, only: %i[show]

  layout 'admin'

  def index
    @pagy, @prayer_vigils = pagy(PrayerVigil.all, items: 10)
  end

  def show
    @walk_number = @prayer_vigil.walk_number
    @bookings = Booking.by_prayer_vigil(PrayerVigil.friendly.find(params[:id]))
  end

  private

  def set_prayer_vigil
    @prayer_vigil = PrayerVigil.friendly.find(params[:id])
  end
end
