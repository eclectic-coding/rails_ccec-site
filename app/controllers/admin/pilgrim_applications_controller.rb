class Admin::PilgrimApplicationsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_pilgrim_application, only: [:show, :edit, :update]

  layout 'admin'

  def index
    @pilgrim_applications = PilgrimApplication.ordered
  end

  def show
  end

  def edit
  end

  def update
  end

  private

  def set_pilgrim_application
    @pilgrim_application = PilgrimApplication.find(params[:id])
  end
end
