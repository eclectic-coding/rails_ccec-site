require "rails_helper"

RSpec.describe "Admin::Users", type: :request do
  describe "Super Admin User" do
    before do
      @admin_user = create(:user, :super_admin)
      sign_in @admin_user
    end

    it "super admin user is redirected to admin dashboard" do
      get admin_root_path
      expect(response).to be_successful
    end

    it "super admin user has role of superadmin" do
      expect(@admin_user.has_role?(:superadmin)).to be true
    end

    it "super admin user has account_id" do
      expect(@admin_user.account_id).to_not be_nil
    end
  end

  describe "Admin User" do
    before do
      @admin_user = create(:user, :admin)
      sign_in @admin_user
    end

    it "admin user is redirected to admin dashboard" do
      get admin_root_path
      expect(response).to be_successful
    end

    it "admin user has role of admin" do
      expect(@admin_user.has_role?(:admin)).to be true
    end

    it "admin user has account_id" do
      expect(@admin_user.account_id).to_not be_nil
    end
  end

  describe "GET /show" do
    before do
      @admin_user = create(:user, :super_admin)
      sign_in @admin_user
    end

    it "renders successful response" do
      user = create(:user)
      get admin_user_path(user)
      expect(response).to be_successful
      expect(user.account_users.first.user_id).to eq(user.id)
    end
  end

  describe "GET /edit" do
    before do
      @admin_user = create(:user, :super_admin)
      sign_in @admin_user
    end

    it "renders successful response" do
      user = create(:user)
      get edit_admin_user_path(user)
      expect(response).to be_successful
    end
  end

  describe "DESTROY /destroy" do
    before do
      @admin_user = create(:user, :super_admin)
      sign_in @admin_user
    end

    it "destroys the requested user" do
      user = create(:user)
      expect {
        delete admin_user_path(user)
      }.to change(User, :count).by(-1)
    end

    it "redirects to the users list" do
      user = create(:user)
      delete admin_user_path(user)
      expect(response).to redirect_to(admin_accounts_path)
    end
  end
end
