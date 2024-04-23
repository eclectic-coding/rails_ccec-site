class Admin::Events::AddressesController < ApplicationController
  # TODO: Work on implementing this feature

  def new
    @address = Address.new
  end

  def create
    @address = Address.new(address_params)

    respond_to do |format|
      if @address.save
        @event = Event.find(params[:address][:id])
        @event.update(address_id: @address.id)
        format.html { redirect_to edit_admin_event_path(@event), notice: 'Address was successfully created.' }
        format.json { render :show, status: :created, location: @address }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @address.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def address_params
    params.require(:address).permit(:name, :street, :city, :state, :zip, :id)
  end
end
