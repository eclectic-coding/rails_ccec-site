require 'rails_helper'

RSpec.describe "Admin::PolyActives", type: :request do
  describe "GET /create" do
    it "returns http success" do
      get "/admin/poly_active/create"
      expect(response).to have_http_status(:success)
    end
  end

end
