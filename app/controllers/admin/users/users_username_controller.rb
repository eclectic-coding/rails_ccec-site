class Admin::Users::UsersUsernameController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user

  def edit
    authorize @user

    render turbo_stream: turbo_stream.replace(
      "edit_username_user_#{params[:user_id]}",
      partial: "admin/users/users_username/form-username",
      locals: { user: @user }
    )
  end

  def update
    authorize @user

    if @user.update(username: params[:username])
      UpdateUserUsernameMailer.with(user: @user).update_user_username.deliver_now

      respond_to do |format|
        format.turbo_stream { flash.now[:notice] = "User's username was successfully updated." }
        format.html
      end
    else
      render turbo_stream: turbo_stream.replace(
        "edit_username_user_#{params[:user_id]}",
        partial: "admin/users/users_username/form-username",
        locals: { account_user: @account_user, user: @user }
      )
    end
  end

  private

  def set_user
    @account_user = AccountUser.find_by(user_id: params[:user_id])
    @user = @account_user.user
  end

  def users_username_params
    params.permit(:username, :account_users_id)
  end
end
