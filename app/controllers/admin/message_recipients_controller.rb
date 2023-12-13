class Admin::MessageRecipientsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_message_recipient, only: [:edit, :update, :destroy]

  def index
    @message_recipients = MessageRecipient.all
  end

  def new
    @message_recipient = MessageRecipient.new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def message_recipient_params
    params.require(:message_recipient).permit(:name, :email)
  end

  def set_message_recipient
    @message_recipient = MessageRecipient.find(params[:id])
  end
end
