class Admin::PrayerVigilsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_prayer_vigil, only: %i[show]

  layout 'admin'

  def index
    @pagy, @prayer_vigils = pagy(PrayerVigil.all, items: 10)
  end

  def show
    @prayer_vigil = @prayer_vigil.bookings.includes(:prayer_slot).order('prayer_slots.start_time ASC')
  end

  private

  def set_prayer_vigil
    @prayer_vigil = PrayerVigil.find(params[:id])
  end
end
