class Admin::Users::UsersRoleController < ApplicationController
  before_action :authenticate_user!
  before_action :set_account_user
  before_action :set_user

  def edit
    authorize @account_user

    render turbo_stream: turbo_stream.replace(
      "edit_role_account_user_#{params[:account_user_id]}",
      partial: "admin/account_users/account_users_role/form-role",
      locals: { account_user: @account_user, user: @user }
    )
  end

  def update
    authorize @account_user
    @account_user.user.roles.first.destroy
    @account_user.user.add_role(users_role_params[:role])

    if @account_user.user.roles.include?(params[:role])

      respond_to do |format|
        format.turbo_stream { flash.now[:notice] = "User's role was successfully updated." }
        format.html
      end
    else
      render turbo_stream: turbo_stream.replace(
        "edit_role_account_user_#{params[:account_user_id]}",
        partial: "admin/account_users/account_users_role/row-role",
        locals: { account_user: @account_user, user: @user }
      )
    end
  end

  private

  def set_account_user
    @account_user = AccountUser.find(params[:account_user_id])
  end

  def set_user
    @user = @account_user.user
  end

  def users_role_params
    params.permit(:role)
  end
end
