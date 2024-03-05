require "system_helper"

RSpec.describe "AdminCreatesEditables", type: :system do
  before do
    login_as create(:user, :super_admin)
    visit admin_editables_path
  end

  describe "admin creates editables with valid credentials" do
    it "creates an editable" do
      click_on "Add Editable"

      fill_in "Shortname", with: "new_editable"
      fill_in "Content", with: "New Editable Content"

      click_on "Create"

      expect(page).to have_content("Editable was successfully created.")
    end
  end

  describe "admin creates editables with invalid credentials" do
    it "does not create an editable" do
      click_on "Add Editable"

      fill_in "Shortname", with: ""
      fill_in "Content", with: "my content"

      click_on "Create"

      expect(page).to have_content("Can't be blank")
    end

  end
end
