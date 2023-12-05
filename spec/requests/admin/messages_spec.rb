require 'rails_helper'

RSpec.describe "Admin::Messages", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/admin/messages/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /show" do
    it "returns http success" do
      get "/admin/messages/show"
      expect(response).to have_http_status(:success)
    end
  end

end
