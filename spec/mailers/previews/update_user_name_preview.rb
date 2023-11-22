require "factory_bot_rails"

# Preview all emails at https://localhost:3000/rails/mailers/update_user_name
class UpdateUserNamePreview < ActionMailer::Preview
  def update_user_name
    user = create(:user, name: "Fred Smith")
    UpdateUserNameMailer.with(user: user).update_user_name
  end
end
