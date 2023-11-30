require "rails_helper"

RSpec.describe "MediaUploadsCreates", type: :system, js: true do
  before do
    login_as create(:user, :admin)
    ActsAsTaggableOn::Tag.create(name: "document")
    visit admin_media_uploads_path
  end

  describe "create media upload" do
    it "creates a media upload" do
      click_link "New Media Upload"

      fill_in "Name", with: "Test Title"
      select "document", from: "media_upload_tag_list"
      fill_in "Description", with: "Test Description"
      attach_file "media_upload[media_file]", Rails.root.join("spec", "support", "assets", "test.pdf")
      click_button "Create"

      expect(page).to have_text "Media upload was successfully created"
    end

    it "creates a media upload with no description" do
      click_link "New Media Upload"

      fill_in "Name", with: "Test Title"
      select "document", from: "media_upload_tag_list"
      attach_file "media_upload[media_file]", Rails.root.join("spec", "support", "assets", "image.png")
      click_button "Create"
    end
  end

  describe "create media upload with invalid data" do
    it "does not create a media upload" do
      click_link "New Media Upload"

      fill_in "Name", with: "Test Title"
      select "document", from: "media_upload_tag_list"
      click_button "Create"
    end
  end
end
