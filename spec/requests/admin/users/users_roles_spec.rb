require "rails_helper"

RSpec.describe "Admin::Users::UsersRoles", type: :request do
  describe "GET /admin/users/users_roles" do
    before do
      @admin_user = create(:user, :super_admin)
      sign_in @admin_user
    end

    describe "GET /admin/users/:user_id/users_role/:id/edit" do
      let(:account_user) { create(:account_user) }

      it "renders edit view" do
        get edit_admin_user_users_role_path(user_id: account_user.user.id, id: account_user.user.id)
        expect(response).to have_http_status(200)
      end
    end

    describe "PATCH /admin/users/:user_id/users_role/:id" do
      let(:account_user) { create(:account_user) }

      context "with valid parameters" do
        it "updates user role" do
          patch admin_user_users_role_path(user_id: account_user.user.id, id: account_user.user.id, params: { user: {
            role: "super_admin"
          } }), as: :turbo_stream
          expect(response).to have_http_status(200)
        end
      end

      context "with invalid parameters" do
        it "does not updates user role" do
          patch admin_user_users_role_path(user_id: account_user.user.id, id: account_user.user.id, params: { user: {
            role: ""
          } }), as: :turbo_stream
          expect(response).to have_http_status(200)
        end
      end
    end
  end
end
