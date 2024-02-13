class Admin::Events::AddressesController < ApplicationController
  def new
  end

  def create
  end

  private

  def address_params
    params.require(:address).permit(:name, :street, :city, :state, :zip)
  end
end
