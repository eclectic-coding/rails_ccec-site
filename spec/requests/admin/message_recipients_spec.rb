require 'rails_helper'

RSpec.describe "Admin::MessageRecipients", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/admin/message_recipients/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /new" do
    it "returns http success" do
      get "/admin/message_recipients/new"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /edit" do
    it "returns http success" do
      get "/admin/message_recipients/edit"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /destroy" do
    it "returns http success" do
      get "/admin/message_recipients/destroy"
      expect(response).to have_http_status(:success)
    end
  end

end
