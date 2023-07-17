require "rails_helper"

RSpec.describe "Admin::Users::UsersEmail", type: :request do
  describe "GET /admin/users/users_email" do
    before do
      @admin_user = create(:user, :super_admin)
      sign_in @admin_user
    end

    describe "GET /admin/users/:user_id/users_email/:id/edit" do
      let(:account_user) { create(:account_user) }

      it "renders edit view" do
        get edit_admin_user_users_email_path(user_id: account_user.user.id, id: account_user.user.id)
        expect(response).to have_http_status(200)
      end
    end

    describe "PATCH /admin/users/:user_id/users_email/:id" do
      let(:account_user) { create(:account_user) }

      context "with valid parameters" do
        it "does updates user email" do
          patch admin_user_users_email_path(user_id: account_user.user_id, id: account_user.id, params: { user: {
            email: "cats@example.com"
          } }), as: :turbo_stream
          expect(response.body).to include("<turbo-stream action=\"replace\" target=\"edit_email_user_#{account_user.user.id}\">")
        end
      end

      context "with invalid parameters" do
        it "does not updates user email" do
          email = account_user.user.email
          patch admin_user_users_name_path(user_id: account_user.user_id, id: account_user.id, params: { user: {
            email: ""
          } }), as: :turbo_stream
          expect(account_user.user.email).to eq(email)
        end
      end
    end
  end
end
