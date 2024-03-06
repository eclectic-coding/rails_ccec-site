require "system_helper"

RSpec.describe "MessageCreates", type: :system do
  before do
    create(:message_recipient)
    visit messages_new_path
  end

  describe "creating a Message" do
    it "creates a Message and sends an email" do
      expect {
        select "Info", from: "Recipient"
        fill_in "Name", with: "John Doe"
        fill_in "Email", with: "test@example.com"
        fill_in "Message", with: "This is a test message."
        click_on "Send Message"
      }.to change {
        ActionMailer::Base.deliveries.size
      }.by(1)

      expect(page).to have_content("Thank you for your message. We will get back to you as soon as possible.")
    end

    it "creates a Message and sends an email" do
      expect {
        select "Info", from: "Recipient"
        fill_in "Name", with: "John Doe"
        fill_in "Email", with: "test@example.com"
        fill_in "Message", with: "This is a test message."
        find(:css, "#message_request_copy").set(true)
        click_on "Send Message"
        sleep 5
      }.to change {
        ActionMailer::Base.deliveries.size
      }.by(2)

      expect(page).to have_content("Thank you for your message. We will get back to you as soon as possible.")
    end

    it "does not send an email if the message is not valid" do
      expect {
        select "Info", from: "Recipient"
        fill_in "Name", with: ""
        fill_in "Email", with: "test@example.com"
        fill_in "Message", with: "This is a test message."
        click_on "Send Message"
      }.to change { ActionMailer::Base.deliveries.size }.by(0)

      expect(page).to have_content("Name can't be blank")
    end
  end
end
