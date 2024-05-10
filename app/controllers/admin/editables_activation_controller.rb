class Admin::EditablesActivationController < ApplicationController
  before_action :authenticate_user!
  before_action :set_editable, only: %i[update]

  def update
    @editable.toggle_active!

    respond_to do |format|
      format.turbo_stream { flash.now[:notice] = t('.update_activation') }
    end
  end

  private

  def set_editable
    @editable = Editable.find(params[:id])
  end
end
