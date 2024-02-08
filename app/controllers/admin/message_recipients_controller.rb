class Admin::MessageRecipientsController < ApplicationController
  before_action :authenticate_user!

  layout "admin"

  def show
    # TODO: Add show action/view
  end

  def new
    @message_recipient = MessageRecipient.new
  end

  def create
    @message_recipient = MessageRecipient.new(message_recipient_params)

    if @message_recipient.save
      redirect_to admin_messages_path, notice: t(".create_success")
    else
      render :new, status: :unprocessable_entity, error: t(".create_error")
    end
  end

  private

  def message_recipient_params
    params.require(:message_recipient).permit(:name, :email)
  end
end
