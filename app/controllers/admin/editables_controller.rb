class Admin::EditablesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_editable, only: %i[edit update destroy]

  layout 'admin'

  def index
    @editables = Editable.all
  end

  def new
    @editable = Editable.new
  end

  def create
    @editable = Editable.new(editable_params)
    if @editable.save
      respond_to do |format|
        format.html { redirect_to admin_editables_path, notice: t(".create_editable") }
        format.turbo_stream { flash.now[:notice] = t('.create_editable') }
      end
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    respond_to do |format|
      if @editable.update(editable_params)
        format.html { redirect_to admin_editables_path, notice: t('.update_editable') }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @editable.destroy
    redirect_to admin_editables_path, notice: t('.destroy_editable')
  end

  private

  def set_editable
    @editable = Editable.find(params[:id])
  end

  def editable_params
    params.require(:editable).permit(:shortname, :content)
  end
end
