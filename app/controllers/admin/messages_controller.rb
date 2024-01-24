class Admin::MessagesController < ApplicationController
  layout "admin"

  def index
    @messages = Message.includes([:message_recipient]).order(created_at: "desc")
    @message_recipients = MessageRecipient.order(name: "asc")
  end

  def show
  end
end
