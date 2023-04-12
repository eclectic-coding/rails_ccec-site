class Admin::AccountsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_account, only: %i[index show edit update destroy]

  layout "admin"

  def index
    @accounts = Account.all
    authorize @accounts
  end

  def show
  end

  def new
  end

  def edit
  end

  def create
  end

  def update
  end

  def destroy
  end

  private

  def set_account
    @account = current_user.account
  end
end
