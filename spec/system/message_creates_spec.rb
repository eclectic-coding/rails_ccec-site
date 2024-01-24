require "rails_helper"

RSpec.describe "MessageCreates", type: :system do
  before do
    create(:message_recipient)
    visit messages_new_path
  end

  describe "creating a Message" do
    it "creates a Message and redirects to the thank you page" do
      select "Info", from: "Recipient"
      fill_in "Name", with: "John Doe"
      fill_in "Email", with: "test@example.com"
      fill_in "Message", with: "This is a test message."
      click_on "Send Message"

      expect(page).to have_content("Thank you for your message. We will get back to you as soon as possible.")
    end
  end
end
