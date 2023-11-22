class Admin::Users::UsersNameController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user

  def edit
    authorize @user

    render turbo_stream: turbo_stream.replace(
      "edit_name_user_#{params[:user_id]}",
      partial: "admin/users/users_name/form-name",
      locals: { user: @user }
    )
  end

  def update
    authorize @user

    if @user.update(name: params[:name])
      @account_user = AccountUser.find_by(user_id: params[:user_id])
      UpdateUserNameMailer.with(user: @user).update_user_name.deliver_now

      respond_to do |format|
        format.turbo_stream { flash.now[:notice] = "User's name was successfully updated." }
        format.html
      end
    else
      render turbo_stream: turbo_stream.replace(
        "edit_name_user_#{params[:user_id]}",
        partial: "admin/users/users_name/form-name",
        locals: { user: @user }
      )
    end
  end

  private

  def set_user
    @account_user = AccountUser.find_by(user_id: params[:user_id])
    @user = @account_user.user
  end

  def users_name_params
    params.permit(:name, :id, :user_id)
  end
end
