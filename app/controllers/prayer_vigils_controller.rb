class PrayerVigilsController < ApplicationController
  def index
    @prayer_vigils = PrayerVigil.active
  end
end
