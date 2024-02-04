require "rails_helper"

RSpec.describe ApplicationPolicy do
  subject { described_class }

  permissions :index?, :show?, :create?, :new?, :update?, :edit?, :destroy? do
    it "denies to all users" do
      expect(subject).not_to permit(User.new)
    end
  end

  describe ApplicationPolicy::Scope do
    let(:user) { User.new }
    let(:scope) { double :scope }

    subject { described_class.new(user, scope) }

    describe "#resolve" do
      it "raises an error" do
        expect { subject.resolve }.to raise_error(NotImplementedError)
      end
    end
  end
end