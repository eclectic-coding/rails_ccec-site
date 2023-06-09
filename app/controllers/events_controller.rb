class EventsController < ApplicationController
  before_action :set_event, only: %i[show]

  # GET /events or /events.json
  def index
    @events = if current_user
      Event.all.order(start_time: :asc)
    else
      Event.where(role: nil).order(start_time: :asc)
    end
    authorize @events
  end

  # GET /events/1 or /events/1.json
  def show
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_event
    @event = Event.find(params[:id])
  end
end
