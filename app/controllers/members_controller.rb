class MembersController < ApplicationController
  before_action :authenticate_user!

  def show
    Rails.logger.debug "show"
  end
end
