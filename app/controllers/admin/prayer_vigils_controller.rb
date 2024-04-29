class Admin::PrayerVigilsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_prayer_vigil, only: %i[show edit update]

  layout 'admin'

  def index
    @pagy, @prayer_vigils = pagy(PrayerVigil.all, items: 10)
  end

  def show
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  private

  def set_prayer_vigil
    @prayer_vigil = PrayerVigil.find(params[:id])
  end
end
