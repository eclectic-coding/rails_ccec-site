require "rails_helper"

RSpec.describe ApplicationPolicy do
  subject { described_class }

  permissions :index?, :show?, :create?, :new?, :update?, :edit?, :destroy? do
    it "denies to all users" do
      expect(subject).not_to permit(User.new)
    end
  end
end
