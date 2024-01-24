class UserProfileMailer < ApplicationMailer
  def update_user_name
    @user = params[:user]
    mail(to: @user.email, subject: t(".name_updated"))
  end

  def update_user_role
    @user = params[:user]
    mail(to: @user.email, subject: t(".role_updated"))
  end

  def update_user_username
    @user = params[:user]
    mail(to: @user.email, subject: t(".username_updated"))
  end

  def update_user_email
    @user = params[:user]
    mail(to: @user.email, subject: t(".email_updated"))
  end
end
