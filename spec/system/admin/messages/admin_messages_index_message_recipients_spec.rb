require "rails_helper"

RSpec.describe "Admin::Messages::IndexMessageRecipients", type: :system do
  before do
    login_as(create(:user, :admin))
  end

  describe "display index table" do
    it "shows message if no message recipients" do
      visit admin_messages_path
      expect(page).to have_content("No message recipients found.")
    end
  end

  describe "display recipients" do
    let!(:message_recipients) { create_list(:message_recipient, 3) }

    it "displays recipients" do
      visit admin_messages_path
      within("table#recipients") do
        expect(page).to have_selector("tbody tr", count: 3)
      end
    end
  end
end
