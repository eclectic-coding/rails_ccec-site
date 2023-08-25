require "rails_helper"

RSpec.describe AddressPolicy do
  subject { described_class }

  permissions :index?, :show? do
    it "grants access to all superadmin users" do
      user = create(:user, :super_admin)
      expect(subject).to permit(user, Address.new)
    end

    it "grants access to all admin users" do
      user = create(:user, :admin)
      expect(subject).to permit(user, Address.new)
    end

    it "denies access to member users" do
      user = create(:user, :member)
      expect(subject).not_to permit(user, Address.new)
    end
  end
end
