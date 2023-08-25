class Admin::AddressesController < ApplicationController
  def index
  end

  def show
  end

  def new
    @address = Address.new
  end

  def create
    @address = Address.create(address_params)

    if @address.save
      redirect_to admin_address_path(@address)
    else
      render :new
    end
  end

  def edit
  end

  def update
  end

  private

  def address_params
    params.require(:address).permit(:name, :street, :city, :state, :zip)
  end
end
