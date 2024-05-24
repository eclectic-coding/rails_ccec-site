class PilgrimApplicationsController < ApplicationController
  def new
  end

  def create
  end

  private

  def pilgrim_application_params
    params.require(:pilgrim_application).permit()
  end
end
