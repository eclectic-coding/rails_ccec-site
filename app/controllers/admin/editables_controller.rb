class Admin::EditablesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_editable, only: %i[edit update]

  layout "admin"

  def index
    @editables = Editable.all
  end

  def new
  end

  def edit
  end

  def update
  end

  private

  def set_editable
    @editable = Editable.find(params[:id])
  end
end
