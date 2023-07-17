require "rails_helper"

RSpec.describe UpdateUsersEmailMailer, type: :mailer do
  include ActiveJob::TestHelper

  describe "Notify user of email address change" do
    specify do
      user = create(:user)
      mail = UpdateUsersEmailMailer.with(user: user).update_user_email

      expect(mail.subject).to eq("Email Update")
      expect(mail.to).to eq([user.email])
    end

    it "sends invitation email immediately" do
      user = create(:user)
      user.email = "new@example.com"

      expect {
        described_class.with(user: user).update_user_email.deliver_now
      }.to change { ActionMailer::Base.deliveries.size }.by(1)
    end
  end
end
