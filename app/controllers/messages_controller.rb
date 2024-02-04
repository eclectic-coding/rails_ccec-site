class MessagesController < ApplicationController
  invisible_captcha only: :create

  def index
  end

  def new
    @message = Message.new
    authorize @message
  end

  def create
    params[:message][:message_recipient] = nil if params[:message][:message_recipient].blank?
    @message = Message.new(message_params.merge(
      message_recipient: MessageRecipient.find_by(id: params[:message][:message_recipient])
    ))
    authorize @message

    if @message.save
      ContactUsMailer.copy_message(@message).deliver_now if @message.request_copy?
      ContactUsMailer.new_message(@message).deliver_now
      redirect_to thank_you_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def message_params
    params.require(:message).permit(:name, :email, :content, :request_copy, :message_recipient)
  end
end
