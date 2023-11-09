require "rails_helper"

RSpec.describe "Admin::MediaUploads", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/admin/media_uploads/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /show" do
    it "returns http success" do
      get "/admin/media_uploads/show"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /new" do
    it "returns http success" do
      get "/admin/media_uploads/new"
      expect(response).to have_http_status(:success)
    end
  end
end
