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
end
