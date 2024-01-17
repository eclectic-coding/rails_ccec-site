class UserProfileMailer < ApplicationMailer
  def update_user_name
    @user = params[:user]
    mail(to: @user.email, subject: "Name Update")
  end

  def update_user_role
    @user = params[:user]
    mail(to: @user.email, subject: "Role Update")
  end

  def update_user_username
    @user = params[:user]
    mail(to: @user.email, subject: "Username Update")
  end

  def update_user_email
    @user = params[:user]
    mail(to: @user.email, subject: "Email Update")
  end
end
