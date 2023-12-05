class Admin::MessageRecipientsController < ApplicationController
  def index
    @message_recipients = MessageRecipient.all
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
