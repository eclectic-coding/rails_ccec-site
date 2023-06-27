class AccountUserPolicy < ApplicationPolicy
  attr_reader :user, :account_user

  def index?
    false
  end

  def edit?
    user.has_role?(:superadmin) || user.has_role?(:admin)
  end

  def update?
    user.has_role?(:superadmin) || user.has_role?(:admin)
  end

  def show?
    user.has_role?(:superadmin) || user.has_role?(:admin)
  end
end
