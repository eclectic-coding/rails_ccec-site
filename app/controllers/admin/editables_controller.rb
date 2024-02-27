class Admin::EditablesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_editable, only: %i[edit update destroy]

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

  def destroy
    @editable.destroy
    redirect_to admin_editables_path, notice: "Editable was successfully destroyed."
  end

  private

  def set_editable
    @editable = Editable.find(params[:id])
  end
end
