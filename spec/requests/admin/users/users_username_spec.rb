require "rails_helper"

RSpec.describe "Admin::Users::UsersUsername", type: :request do
  describe "GET /admin/users/users_username" do
    before do
      @admin_user = create(:user, :super_admin)
      sign_in @admin_user
    end

    describe "GET /admin/users/:user_id/users_name/:id/edit" do
      let(:account_user) { create(:account_user) }

      it "renders edit view" do
        get edit_admin_user_users_username_path(user_id: account_user.user.id, id: account_user.user.id)
        expect(response).to have_http_status(200)
      end
    end

    describe "PATCH /admin/users/:user_id/users_username/:id" do
      let(:account_user) { create(:account_user) }

      context "with valid parameters" do
        xit "updates users username" do
          patch admin_user_users_username_path(user_id: account_user.user_id, id: account_user.id, params: { user: {
            username: "testuser"
          } }), as: :turbo_stream
          # account_user.reload
          # p account_user.user
          # expect(account_user.user.username).to eq("testuser")
        end
      end

      context "with invalid parameters" do
        xit "does not updates user name" do
          patch admin_user_users_name_path(user_id: account_user.user_id, id: account_user.id, params: { user: {
            name: ""
          } }), as: :turbo_stream
          expect(account_user.user.name).to eq("Example User")
        end
      end
    end
  end
end
