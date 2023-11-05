class HomeController < ApplicationController
  def index
    @events = Event.after_today.where(role: nil).limit(3)
  end
end
