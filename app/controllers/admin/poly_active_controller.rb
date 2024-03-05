class Admin::PolyActiveController < ApplicationController
  before_action :authenticate_user!
  before_action :set_editable, only: [:update]

  def update
    @editable.poly_actives.first.toggle!(:active)

    respond_to do |format|
      format.turbo_stream { flash.now[:notice] = "Editable status was successfully updated." }
    end

  end

  private

  def set_editable
    @editable = Editable.find(params[:editable_id])
  end
end
