require "system_helper"

RSpec.describe "Admin::Addresses::CreateAddresses", type: :system do
  before do
    login_as create(:user, :super_admin)
    visit admin_addresses_path

    # Stub the geocode method to avoid hitting the external API
    allow_any_instance_of(Address).to receive(:geocode).and_return([1, 1])
  end

  describe "create new address with valid data" do
    it "should create new address" do
      click_on "Add Venue"
      fill_in "Name", with: "Test Address"
      fill_in "Street", with: "123 Test St"
      select "Leland", from: "City"
      click_on "Create Venue"

      expect(page).to have_content("Address was successfully created.")
    end
  end

  describe "create new address with invalid data" do
    it "should not create new address" do
      click_on "Add Venue"
      fill_in "Name", with: "Test Address"
      fill_in "Street", with: ""
      select "Leland", from: "City"
      click_on "Create Venue"

      expect(page).to have_content("Street can't be blank")
    end
  end
end
