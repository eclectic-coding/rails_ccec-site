class StaticController < ApplicationController
  def home
    flash[:notice] = "test"
    flash[:alert] = "danger"
  end

  def attending
  end

  def questions
  end

  def sponsorship
  end

  def info
  end
end
