class AccountPolicy < ApplicationPolicy
  attr_reader :user, :account

  def initialize(user, account)
    @user = user
    @account = account
  end

  def index?
    user.has_role?(:superadmin) || user.has_role?(:admin)
  end
end
