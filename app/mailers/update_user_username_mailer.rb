class UpdateUserUsernameMailer < ApplicationMailer
  def update_user_username
    @user = params[:user]
    mail(to: @user.email, subject: "Username Update")
  end
end
