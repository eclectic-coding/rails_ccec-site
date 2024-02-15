class EventsController < ApplicationController
  before_action :set_event, only: %i[show]

  # GET /events or /events.json
  def index
    @events = if current_user
      Event.after_today
    else
      Event.after_today.where(role: "")
    end
    authorize @events
  end

  # GET /events/1 or /events/1.json
  def show
    @decorated_event = EventDecorator.new(@event)
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_event
    @event = Event.find(params[:id])
  end
end
