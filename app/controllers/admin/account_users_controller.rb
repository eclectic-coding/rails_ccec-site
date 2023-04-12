class Admin::AccountUsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_account, only: %i[show new create destroy]
  # before_action :set_user, only: %i[show]

  layout "admin"

  def index
  end

  def show
    @account_user = AccountUser.find_by(user_id: params[:id])
    authorize @account_user
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
    @account.account_users.find_by(user_id: params[:format]).destroy

    redirect_to admin_accounts_path, notice: "Account user was successfully destroyed."
  end

  private

  def set_account
    @account = current_user.account
  end

  def account_user_params
    params.require(:account_user).permit(:email, :name, :role_id)
  end
end
