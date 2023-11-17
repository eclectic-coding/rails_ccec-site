class Admin::AddressesController < ApplicationController
  before_action :set_address, only: %i[edit update destroy]

  layout "admin"

  def index
    @addresses = Address.all
    authorize @addresses
  end

  def new
    @address = Address.new
    authorize @address
  end

  def create
    @address = Address.create(address_params)

    respond_to do |format|
      if @address.save
        format.html { redirect_to admin_addresses_path, notice: "Address was successfully created." }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def edit
  end

  def update
    @address.update(address_params)

    respond_to do |format|
      if @address.save
        format.html { redirect_to admin_addresses_path, notice: "Address was successfully updated." }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @address.destroy

    respond_to do |format|
      format.html { redirect_to admin_addresses_path, status: :see_other, notice: "Venue was successfully removed." }
    end
  end

  private

  def address_params
    params.require(:address).permit(:name, :street, :city, :state, :zip)
  end

  def set_address
    @address = Address.find(params[:id])
  end
end
