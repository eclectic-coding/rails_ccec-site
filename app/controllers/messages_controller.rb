class MessagesController < ApplicationController
  def index
  end

  def new
    @message = Message.new
  end

  def create
    params[:message][:message_recipient] = nil if params[:message][:message_recipient].blank?
    @message = Message.new(message_params.merge(
      message_recipient: MessageRecipient.find_by(id: params[:message][:message_recipient])
    ))

    if @message.save
      redirect_to message_path(@message)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def message_params
    params.require(:message).permit(:name, :email, :content, :request_copy, :message_recipient)
  end
end
