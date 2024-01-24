require "rails_helper"

RSpec.describe UserProfileMailer, type: :mailer do
  include ActiveJob::TestHelper

  describe "Notify user of email address change" do
    specify do
      user = create(:user)
      mail = described_class.with(user: user).update_user_email

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

  describe "Notify user of name change" do
    specify do
      user = create(:user)
      mail = described_class.with(user: user).update_user_name

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

  describe "Notify user of email address change" do
    specify do
      user = create(:user, :member)
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

  describe "Notify user of username change" do
    specify do
      user = create(:user)
      mail = described_class.with(user: user).update_user_username

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
