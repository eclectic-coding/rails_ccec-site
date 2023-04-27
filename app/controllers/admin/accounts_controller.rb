class Admin::AccountsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_account, only: %i[index show]

  layout "admin"

  def index
    @accounts = Account.all
    authorize @accounts
  end

  def show
  end

  private

  def set_account
    @account = current_user.account
  end
end
