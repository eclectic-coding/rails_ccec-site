require 'rails_helper'

RSpec.describe "Admin::PilgrimApplications", type: :request do
  before do
    login_as(create(:user, :admin))
  end

  describe "GET /admin/pilgrim_applications" do
    it "works! (now write some real specs)" do
      get admin_pilgrim_applications_path
      expect(response).to have_http_status(200)
    end
  end
end
