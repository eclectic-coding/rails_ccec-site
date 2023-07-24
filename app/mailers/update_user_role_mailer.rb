class UpdateUserRoleMailer < ApplicationMailer
  def update_user_role
    @user = params[:user]
    mail(to: @user.email, subject: "Role Update")
  end
end
