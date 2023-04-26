require "rails_helper"

RSpec.describe "Events", type: :request do
  describe "GET /admin/events" do
    before do
      @user = sign_in create(:user, :admin)
    end

    it "works! (now write some real specs)" do
      p @user
      get "/admin"
      expect(response).to have_http_status(200)
    end
  end
end
