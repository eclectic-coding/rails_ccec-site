class Admin::Users::UsersRoleController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, only: [:edit, :update]

  def edit
    authorize @user

    render turbo_stream: turbo_stream.replace(
      "edit_role_account_user_#{params[:account_user_id]}",
      partial: "admin/users/users_role/form-role",
      locals: { account_user: @account_user, user_id: @user.id }
    )
  end

  def update
    authorize @user

    @user.add_role(params[:role])

    if @user.has_role?(params[:role])
      UpdateUserRoleMailer.with(user: @user).update_user_role.deliver_now

      respond_to do |format|
        format.turbo_stream { flash.now[:notice] = "User's role was successfully updated." }
        format.html
      end
    else
      render turbo_stream: turbo_stream.replace(
        "edit_role_account_user_#{params[:account_user_id]}",
        partial: "admin/users/users_role/row-role",
        locals: { account_user: @account_user, user: @user }
      )
    end
  end

  private

  def set_user
    @account_user = AccountUser.find_by(user_id: params[:user_id])
    @user = @account_user.user
  end

  def users_role_params
    params.permit(:role)
  end
end
