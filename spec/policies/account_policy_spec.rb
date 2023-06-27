require "rails_helper"

RSpec.describe AccountPolicy do
  subject { described_class }

  permissions :index? do
    it "grants access to superadmin users" do
      user = create(:user, :super_admin)
      expect(subject).to permit(user, Account.new)
    end

    it "grants access to admin users" do
      user = create(:user, :admin)
      expect(subject).to permit(user, Account.new)
    end

    it "denies access to member users" do
      expect(subject).not_to permit(User.new, Account.new)
    end
  end
end
