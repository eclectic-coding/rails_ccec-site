class Admin::AccountUsers::AccountUsersNameController < ApplicationController
  before_action :authenticate_user!
  before_action :set_account_user
  before_action :set_user

  def edit
    authorize @account_user

    render turbo_stream: turbo_stream.replace(
      "edit_name_account_user_#{params[:account_user_id]}",
      partial: "admin/account_users/account_users_name/form-name",
      locals: { account_user: @account_user, user: @user }
    )
  end

  def update
    authorize @account_user
    if @account_user.update(users_name_params)

      respond_to do |format|
        format.turbo_stream { flash.now[:notice] = "User's name was successfully updated." }
        format.html
      end
    else
      # render turbo_stream: turbo_stream.replace(
      #   "edit_name_account_user_#{params[:account_user_id]}",
      #   partial: "admin/account_users/account_users_name/form-name",
      #   locals: { account_user: @account_user, user: @user }
      # )
      respond_to do |format|
        format.turbo_stream { flash.now[:alert] = "User's name was not updated." }
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  private

  def set_account_user
    @account_user = AccountUser.find(params[:account_user_id])
  end

  def set_user
    @user = @account_user.user
  end

  def users_name_params
    params.permit(:name, :account_users_id)
  end
end
