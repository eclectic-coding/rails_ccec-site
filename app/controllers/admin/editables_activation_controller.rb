class Admin::EditablesActivationController < ApplicationController
  before_action :authenticate_user!
  before_action :set_editable, only: %i[update]

  def update
    # rubocop:disable Rails/SkipsModelValidations
    @editable.poly_actives.first.toggle!(:active)
    # rubocop:enable Rails/SkipsModelValidations

    respond_to do |format|
      format.turbo_stream { flash.now[:notice] = "Editable status was successfully updated." }
    end
  end

  private

  def set_editable
    @editable = Editable.find(params[:id])
  end
end
