require "rails_helper"

RSpec.describe "Admin::AccountUsers::AccountUsersNames", type: :request do
  before do
    @admin_user = create(:user, :super_admin)
    sign_in @admin_user
  end

  describe "GET /admin/account_users/:account_user_id/account_users_name/:id/edit" do
    let(:account_user) { create(:account_user) }

    it "renders edit view" do
      get edit_admin_account_user_account_users_name_path(account_user_id: account_user.id, id: account_user.user_id)
      expect(response).to have_http_status(200)
    end
  end

  describe "PATCH /admin/account_users/:account_user_id/account_users_name/:id" do
    let(:account_user) { create(:account_user) }

    context "with valid parameters" do
      it "updates the requested account user name" do
        patch admin_account_user_account_users_name_path(account_user_id: account_user.id, id: account_user.user_id, params: { account_user: {
          account_user_id: account_user.id, name: "Test User"
        } }), as: :turbo_stream
        expect {
          response.to have_http_status(:ok)
          response.media_type.to eq Mime[:turbo_stream]
          response.body.to include("<turbo-stream action=\"replace\" target=\"edit_name_account_user_#{account_user.id}\">")
        }
      end
    end

    context "with invalid parameters" do
      it "updates the requested account user name" do
        patch admin_account_user_account_users_name_path(account_user_id: account_user.id, id: account_user.user_id, params: { account_user: {
          account_user_id: account_user.id, name: ""
        } }), as: :turbo_stream
        expect {
          response.to have_http_status(:unprocessable_entity)
          response.media_type.to eq Mime[:turbo_stream]
          response.body.to include("{account_user.id}\">")
        }
      end
    end
  end
end
