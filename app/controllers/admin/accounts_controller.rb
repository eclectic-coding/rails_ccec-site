class Admin::AccountsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_account, only: %i[index]

  layout "admin"

  def index
    @accounts = Account.all
    authorize @accounts
  end

  private

  def set_account
    @account = current_user.account
  end
end
