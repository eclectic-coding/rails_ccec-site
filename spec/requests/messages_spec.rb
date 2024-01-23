require "rails_helper"

RSpec.describe "Messages", type: :request do
  include InvisibleCaptcha

  describe "GET /new" do
    it "returns http success" do
      get messages_new_path
      expect(response).to have_http_status(:success)
      expect(response.body).to include(InvisibleCaptcha.sentence_for_humans)
    end
  end
end
