require "rails_helper"

RSpec.describe "Admin::Users::UsersNames", type: :request do
  describe "GET /admin/users/users_names" do
    before do
      @admin_user = create(:user, :super_admin)
      sign_in @admin_user
    end

    describe "GET /admin/users/:user_id/users_name/:id/edit" do
      let(:user) { create(:user) }

      it "renders edit view" do
        get edit_admin_user_users_name_path(user_id: user.id, id: user.id)
        expect(response).to have_http_status(200)
      end
    end

    describe "PATCH /admin/users/:user_id/users_name/:id" do
      let(:account_user) { create(:account_user) }

      context "with valid parameters" do
        it "does updates user name" do
          patch admin_user_users_name_path(user_id: account_user.user_id, id: account_user.id, params: { user: {
            name: "Test User"
          } }), as: :turbo_stream
          expect(response.body).to include("<turbo-stream action=\"replace\" target=\"edit_name_user_#{account_user.user.id}\">")
        end
      end

      context "with invalid parameters" do
        it "does not updates user name" do
          patch admin_user_users_name_path(user_id: account_user.user_id, id: account_user.id, params: { user: {
            name: ""
          } }), as: :turbo_stream
          p account_user.user
          expect(account_user.user.name).to eq("Example User")
        end
      end
    end
  end
end
