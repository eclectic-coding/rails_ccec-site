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
  end
end
