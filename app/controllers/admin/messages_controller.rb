class Admin::MessagesController < ApplicationController
  layout "admin"

  def index
    @messages = Message.all
    @recipients = MessageRecipient.all
  end

  def show
  end
end
