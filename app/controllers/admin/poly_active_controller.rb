class Admin::PolyActiveController < ApplicationController
  before_action :authenticate_user!
  before_action :set_editable, only: [:update]

  def update
    @editable.poly_actives.first.toggle!(:active)
    p "active: #{@editable.poly_actives.inspect}"

    respond_to do |format|
      format.html {
        headers["WWW-Authenticate"] = root_path
        head :unauthorized
      }

      format.turbo_stream {
        render turbo_stream: turbo_stream.update(
          "activate_editable_#{params[:editable_id]}",
          partial: "admin/editables/activation",
          locals: { editable: @editable }
        )
      }
    end

  end

  private

  def poly_active_params
    params.require(:poly_active).permit(:activatable_id, :activatable_type, :active)
  end

  def set_editable
    @editable = Editable.find(params[:editable_id])
  end
end
