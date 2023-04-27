require "rails_helper"

RSpec.describe "Users", type: :request do
  describe "Login as regular user" do
    before do
      @user = create(:user, :member)
      sign_in @user
    end

    it "user is redirected to root path" do
      get root_path
      expect(response).to be_successful
    end

    it "user has account_id" do
      expect(@user.account_id).to_not be_nil
    end

    it "user has role of member" do
      expect(@user.has_role?(:member)).to be true
    end
  end
end
