# frozen_string_literal: true

class ContactUsMailer < ApplicationMailer
  def new_message(message)
    @message = message
    mail(to: @message.message_recipient.email, subject: t('.new_message'))
  end

  def copy_message(message)
    @message = message
    mail(to: @message.email, subject: t('.copy_message'))
  end
end
