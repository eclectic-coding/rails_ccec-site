require "rails_helper"

RSpec.describe "Admin::MessageRecipients", type: :request do
  describe "GET /admin/message_recipients" do
    xit "works! (now write some real specs)" do
      login_as(create(:user, :admin))
      get admin_message_recipients_path
      expect(response).to have_http_status(200)
    end
  end
end
