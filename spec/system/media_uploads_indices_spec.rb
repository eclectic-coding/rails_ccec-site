require "system_helper"

RSpec.describe "MediaUploadsIndices", type: :system do
  before do
    login_as create(:user, :super_admin)
    create(:media_upload, name: "Walk 1")
    visit admin_media_uploads_path
  end

  describe "index" do
    it "displays media uploads" do
      within "tbody tr:nth-child(1)" do
        expect(page).to have_text "Walk 1"
      end
    end

    it "follow media_upload link" do
      click_link "Walk 1"
      expect(page).to have_content "Walk 1"
    end
  end
end
