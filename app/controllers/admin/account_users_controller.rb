class Admin::AccountUsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_account, only: [:show, :new, :create]

  layout 'admin'

  def show
    @account_user = AccountUser.find_by(user_id: params[:user_id])
  end

  def new
    @account_user = AccountUser.new
    @roles = current_user.has_role?(:superadmin) ? Role.all : Role.all_except
  end

  def create
    account_user = @account.account_users.new(account_user_params)
    account_user.account = @account
    @roles = current_user.has_role?(:superadmin) ? Role.all : Role.all_except

    if account_user.save!
      redirect_to admin_accounts_path, notice: t('.create_account_user')
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def set_account
    @account = current_user.account
  end

  def account_user_params
    params.require(:account_user).permit(:username, :email, :name, :role_id)
  end
end
