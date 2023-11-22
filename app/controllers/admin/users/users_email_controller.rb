class Admin::Users::UsersEmailController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user

  def edit
    authorize @user

    render turbo_stream: turbo_stream.replace(
      "edit_email_user_#{params[:user_id]}",
      partial: "admin/users/users_email/form-email",
      locals: { user: @user }
    )
  end

  def update
    authorize @user

    if @user.update(email: params[:email])
      UpdateUsersEmailMailer.with(user: @user).update_user_email.deliver_now

      respond_to do |format|
        format.turbo_stream { flash.now[:notice] = "User's email was successfully updated." }
        format.html
      end
    else
      render turbo_stream: turbo_stream.replace(
        "edit_email_account_user_#{params[:account_user_id]}",
        partial: "admin/users/users_email/form-email",
        locals: { account_user: @account_user, user: @user }
      )
    end
  end

  private

  def set_user
    @account_user = AccountUser.find_by(user_id: params[:user_id])
    @user = @account_user.user
  end

  def users_email_params
    params.permit(:email)
  end
end
