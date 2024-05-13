class Admin::PrayerVigilsActivationController < ApplicationController
  before_action :authenticate_user!
  before_action :set_prayer_vigil, only: %i[update]

  def update
    @prayer_vigil.toggle_active!

    respond_to do |format|
      format.turbo_stream { flash.now[:notice] = t('.activation') }
    end
  end

  private

  def set_prayer_vigil
    @prayer_vigil = PrayerVigil.find(params[:id])
  end
end
