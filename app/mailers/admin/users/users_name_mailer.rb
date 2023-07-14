class Admin::Users::UsersNameMailer < ApplicationMailer
  def name_updated
    params[:user]

    mail to: params[:user].email, subject: "Your name was updated"
  end
end
