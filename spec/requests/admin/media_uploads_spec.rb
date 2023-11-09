require "rails_helper"

RSpec.describe "Admin::MediaUploads", type: :request do
  before do
    sign_in create(:user, :admin)
  end

  describe "GET /admin/media_uploads" do
    it "returns http success" do
      get admin_media_uploads_path
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /admin/media_uploads/:id" do
    it "returns http success" do
      media = create(:media_upload)
      get admin_media_upload_path(media)
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /admin/media_uploads/new" do
    it "returns http success" do
      get new_admin_media_upload_path
      expect(response).to have_http_status(:success)
    end
  end
end
