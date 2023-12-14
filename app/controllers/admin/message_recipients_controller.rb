class Admin::MessageRecipientsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_message_recipient, only: [:edit, :update, :destroy]

  def new
    @message_recipient = MessageRecipient.new
  end

  def create
    @message_recipient = MessageRecipient.new(message_recipient_params)

    if @message_recipient.save
      redirect_to admin_messages_path, notice: "Message recipient was successfully created."
    else
      render :new, status: :unprocessable_entity, error: "Message recipient could not be created."
    end
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
