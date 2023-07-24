require "rails_helper"

RSpec.describe UpdateUserRoleMailer, type: :mailer do
  include ActiveJob::TestHelper

  describe "Notify user of email address change" do
    specify do
      user = create(:user)
      mail = described_class.with(user: user).update_user_role

      expect(mail.subject).to eq("Role Update")
      expect(mail.to).to eq([user.email])
    end

    it "sends invitation email immediately" do
      user = create(:user)
      user.add_role(:admin)

      expect {
        described_class.with(user: user).update_user_role.deliver_now
      }.to change { ActionMailer::Base.deliveries.size }.by(1)
    end
  end
end
