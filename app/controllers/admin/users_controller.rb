class Admin::UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, only: %i[show edit update destroy]
  before_action :set_account, only: %i[show edit update destroy]

  layout "admin"

  def show
  end

  def edit
    @roles = current_user.has_role?(:superadmin) ? Role.all : Role.all_except
    @account_user = @user.account_users.first
  end

  def update
    @roles = current_user.has_role?(:superadmin) ? Role.all : Role.all_except
    @account_user = @user.account_users.first

    role_id = user_params[:account_users_attributes]["0"][:role_id]
    @user = User.find(params[:id])
    @user.remove_role Role.find(role_id).name if @user.account_users.first.role_id.present?
    @user.add_role Role.find(role_id).name if user_params[:account_users_attributes]["0"][:role_id].present?

    if @user.update(user_params)
      # TODO: need mailers added here
      redirect_to admin_user_path(@user), notice: t(".updated")
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @account_user.destroy
    @user.destroy

    redirect_to admin_accounts_path, notice: t(".destroyed")
  end

  private

  def set_user
    @user = User.find(params[:id])
    @account = @user.account
    @account_user = @user.account_users.first
  end

  def set_account
    @account = current_user.account
  end

  def user_params
    params.require(:user).permit(:user_id, :name, :username, :email, :account_user_id, :role_id,
      account_users_attributes: [:id, :role_id])
  end
end
