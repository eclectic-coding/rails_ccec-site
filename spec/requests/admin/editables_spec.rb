require 'rails_helper'

RSpec.describe "Admin::Editables", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/admin/editables/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /show" do
    it "returns http success" do
      get "/admin/editables/show"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /new" do
    it "returns http success" do
      get "/admin/editables/new"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /edit" do
    it "returns http success" do
      get "/admin/editables/edit"
      expect(response).to have_http_status(:success)
    end
  end

end
