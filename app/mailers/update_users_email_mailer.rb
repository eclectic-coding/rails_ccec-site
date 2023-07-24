class UpdateUsersEmailMailer < ApplicationMailer
  def update_user_email
    @user = params[:user]
    mail(to: @user.email, subject: "Email Update")
  end
end
