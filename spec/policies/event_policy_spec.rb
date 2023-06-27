require "rails_helper"

RSpec.describe EventPolicy do
  subject { described_class }

  permissions :index? do
    it "grants access to all users" do
      expect(subject).to permit(User.new, Event.new)
    end
  end
end
