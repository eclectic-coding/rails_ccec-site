require "rails_helper"

RSpec.describe "MediaUploadsUpdates", type: :system, js: true do
  before do
    login_as create(:user, :admin)
    create(:media_upload)
    visit admin_media_uploads_path
  end

  describe "updating a new media upload" do
    it "updates the media upload name" do
      click_link "MyDocument"

      fill_in "Name", with: "New Title"
      click_button("Update")
    end

    it "updates the media upload category" do
      ActsAsTaggableOn::Tag.create(name: "Roster")
      click_link "MyDocument"

      select "Roster", from: "media_upload_tag_list"
      click_button("Update")
    end

    it "updates the media upload document" do
      click_link "MyDocument"

      attach_file "media_upload[media_file]", Rails.root.join("spec", "support", "assets", "test.pdf")
      click_button("Update")
    end

    it "updates the media upload description" do
      ActsAsTaggableOn::Tag.create(name: "Roster")
      click_link "MyDocument"

      fill_in "Description", with: "New Description for a test"
      click_button("Update")
    end
  end
end
