require "system_helper"

RSpec.describe "AdminUpdatesEditableStatus", type: :system do
  let!(:editable) { create(:editable) }

  before do
    login_as create(:user, :super_admin)
    visit admin_editables_path
  end

  describe "admin updates editable status" do
    it "updates the editable status" do

      within "#activate_editable_#{editable.id}" do
        find(".capitalize").click
      end

      expect(page).to have_content("Editable status was successfully updated.")
    end
  end
end