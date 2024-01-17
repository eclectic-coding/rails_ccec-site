# frozen_string_literal: true

class ContactUsMailer < ApplicationMailer
  def new_message(message)
    @message = message
    mail(to: @message.message_recipient.email, subject: 'New Message')
  end

  def copy_message(message)
    @message = message
    mail(to: @message.email, subject: 'Copy of your Message')
  end
end
