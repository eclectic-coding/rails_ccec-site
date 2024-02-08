require "rails_helper"

RSpec.describe "Admin::MessageRecipients::CreateMessageRecipients", type: :system, js: true do
  before do
    login_as create(:user, :admin)
  end

  describe "creating a new message recipient" do
    it "creates a new message recipient" do
      visit admin_messages_path
      click_link "New Recipient"

      fill_in "Name", with: "Bob Smith"
      fill_in "Email", with: "new@example.com"
      click_button "Create Recipient"

      expect(page).to have_text "Bob Smith"
      expect(page).to have_content("Message recipient was successfully created.")
    end
  end

  describe "create message recipient with invalid data" do
    it "does not create a message recipient without a name" do
      visit admin_messages_path
      click_link "New Recipient"
      fill_in "Name", with: ""
      fill_in "Email", with: "john@example.com"
      click_button "Create Recipient"
      expect(page).to have_content("Name can't be blank")
    end

    it "does not create a message recipient without an email" do
      visit admin_messages_path
      click_link "New Recipient"
      fill_in "Name", with: "John Doe"
      fill_in "Email", with: ""
      click_button "Create Recipient"
      expect(page).to have_content("Email can't be blank")
    end
  end
end
