class Admin::PrayerVigilsActivationController < ApplicationController
  before_action :authenticate_user!
  before_action :set_prayer_vigil, only: %i[update]

  def update
    # rubocop:disable Rails/SkipsModelValidations
    @prayer_vigil.poly_actives.first.toggle!(:active)
    # rubocop:enable Rails/SkipsModelValidations

    respond_to do |format|
      format.turbo_stream { flash.now[:notice] = t('.activation') }
    end
  end

  private

  def set_prayer_vigil
    @prayer_vigil = PrayerVigil.find(params[:id])
  end
end
