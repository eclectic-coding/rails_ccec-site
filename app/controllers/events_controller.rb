class EventsController < ApplicationController
  before_action :set_event, only: %i[show]

  # GET /events or /events.json
  def index
    @events = if current_user
      Event.after_today.includes(:address)
    else
      Event.after_today.includes(:address).where(role: nil)
    end
    authorize @events
  end

  # GET /events/1 or /events/1.json
  def show
    index # to load @events for footer
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_event
    @event = Event.find(params[:id])
  end
end
