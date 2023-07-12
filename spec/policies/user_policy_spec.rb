require "rails_helper"

RSpec.describe UserPolicy do
  subject { described_class }

  permissions :index? do
    it "deny all access member users" do
      user = create(:user)
      expect(subject).not_to permit(user, Account.new)
    end

    it "deny all access admin users" do
      user = create(:user, :admin)
      expect(subject).not_to permit(user, Account.new)
    end

    it "denys all access to super_admin users" do
      expect(subject).not_to permit(User.new, Account.new)
    end
  end

  permissions :edit?, :update?, :show? do
    it "denys access member users" do
      user = create(:user)
      expect(subject).not_to permit(user, Account.new)
    end

    it "grants access admin users" do
      user = create(:user, :admin)
      expect(subject).to permit(user, Account.new)
    end

    it "grants access to super_admin users" do
      user = create(:user, :super_admin)
      expect(subject).to permit(user, Account.new)
    end
  end
end
