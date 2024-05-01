class Admin::EventsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_event, only: %i[show edit update destroy]
  include Filterable

  layout 'admin'

  # GET /events or /events.json
  def index
    session[:event_filters] = {}

    @pagy, @events = pagy(Event.admin_view, items: 10)
  end

  def list
    @pagy, @events = pagy(filter!(Event), items: 10)

    render(partial: 'admin/events/events', locals: { events: @events, pagy: @pagy })
  end

  # GET /events/1 or /events/1.json
  def show
  end

  # GET /events/new
  def new
    @event = Event.new
  end

  # GET /events/1/edit
  def edit
    # @role = Role.find_by(name: @event.role).id
  end

  # POST /events or /events.json
  def create
    @event = Event.new(event_params)

    respond_to do |format|
      if @event.save
        format.html { redirect_to admin_events_path, notice: t('.create_notice') }
        format.json { render :show, status: :created, location: @event }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /events/1 or /events/1.json
  def update
    respond_to do |format|
      if @event.update(event_params)
        format.html { redirect_to admin_events_path, notice: t('.update_notice') }
        format.json { render :show, status: :ok, location: @event }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /events/1 or /events/1.json
  def destroy
    PrayerVigil.where(walk_number: @event.walk_number).destroy_all
    Event.where(connected_event_id: @event.id).destroy_all
    @event.destroy

    respond_to do |format|
      format.html { redirect_to admin_events_path, notice: t('.destroy_notice') }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_event
    @event = Event.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def event_params
    params.require(:event).permit(
      :name,
      :walk_number,
      :start_time,
      :role,
      :description,
      :end_time, :event_type,
      :address_id
    )
  end
end
