class Admin::AccountUsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_account, only: %i[new create]

  layout "admin"

  def index
  end

  def new
    @account_user = AccountUser.new
  end

  def create
    account_user = @account.account_users.new(account_user_params)
    account_user.account = @account

    if account_user.save
      redirect_to admin_accounts_path, notice: "Account user was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
  end

  private

  def set_account
    @account = current_user.account
  end

  def account_user_params
    params.require(:account_user).permit(:email, :name, :role_id)
  end
end
