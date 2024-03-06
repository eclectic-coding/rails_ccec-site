require "rails_helper"

RSpec.describe "Admin::Editables", type: :request do
  before do
    login_as(create(:user, :admin))
  end

  describe "GET /index" do
    it "returns http success" do
      get admin_editables_path
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /new" do
    it "returns http success" do
      get new_admin_editable_path
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /edit" do
    it "returns http success" do
      get edit_admin_editable_path(create(:editable))
      expect(response).to have_http_status(:success)
    end
  end

  describe "DESTROY " do
    it "deletes an editable" do
      editable = create(:editable)
      expect {
        delete admin_editable_path(editable)
      }.to change(Editable, :count).by(-1)
    end
  end
end
