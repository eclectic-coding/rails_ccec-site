class Admin::DashboardController < ApplicationController
  before_action :authenticate_user!

  layout "admin"

  def show
    @admin = current_user.has_role?(:admin)
  end
end
