require "rails_helper"

RSpec.describe "Admin::Messages::CreateMessageRecipients", type: :system do
  before do
    login_as(create(:user, :admin))
  end

  describe "create message recipient" do
    it "creates a message recipient" do
      visit admin_messages_path
      click_link "New Recipient"
      fill_in "Name", with: "John Doe"
      fill_in "Email", with: "john@example.com"
      click_button "Create Recipient"
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
