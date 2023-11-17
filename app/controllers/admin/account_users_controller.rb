class Admin::AccountUsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_account, only: %i[show new create destroy]
  before_action :set_account_user, only: [:show, :destroy]

  layout "admin"

  def show
    @account_user = AccountUser.find_by(user_id: params[:user_id])
    authorize @account_user
  end

  def new
    @account_user = AccountUser.new
  end

  def create
    account_user = @account.account_users.new(account_user_params)
    account_user.account = @account

    if account_user.save
      redirect_to admin_accounts_path, notice: t(".create_account_user")
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @account_user.destroy

    redirect_to admin_accounts_path, notice: t(".destroy_account_user")
  end

  private

  def set_account
    @account = current_user.account
  end

  def set_account_user
    @account_user = AccountUser.find_by(user_id: params[:user_id])
  end

  def account_user_params
    params.require(:account_user).permit(:username, :email, :name, :role_id)
  end
end
