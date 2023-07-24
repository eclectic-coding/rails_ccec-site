require "rails_helper"

RSpec.describe UpdateUserNameMailer, type: :mailer do
  include ActiveJob::TestHelper

  describe "Notify user of name change" do
    specify do
      user = create(:user)
      mail = UpdateUserNameMailer.with(user: user).update_user_name

      expect {
        mail.subject.to eq("Name Update")
        mail.to.to eq([user.email])
      }
    end

    it "sends invitation email immediately" do
      user = create(:user)
      user.name = "Fred Sanford"

      expect {
        described_class.with(user: user).update_user_name.deliver_now
      }.to change { ActionMailer::Base.deliveries.size }.by(1)
    end
  end
end
