require "rails_helper"

RSpec.describe UpdateUserUsernameMailer, type: :mailer do
  describe "Notify user of username change" do
    specify do
      user = create(:user)
      mail = UpdateUserUsernameMailer.with(user: user).update_user_username

      expect {
        mail.subject.to eq("Username Update")
        mail.to.to eq([user.email])
      }
    end

    it "sends invitation email immediately" do
      user = create(:user)
      user.username = "Fred Sanford"

      expect {
        described_class.with(user: user).update_user_username.deliver_now
      }.to change { ActionMailer::Base.deliveries.size }.by(1)
    end
  end
end
