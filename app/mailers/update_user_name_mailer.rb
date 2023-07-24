class UpdateUserNameMailer < ApplicationMailer
  def update_user_name
    @user = params[:user]
    mail(to: @user.email, subject: "Name Update")
  end
end
