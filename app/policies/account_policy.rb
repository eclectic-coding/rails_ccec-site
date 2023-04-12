class AccountPolicy < ApplicationPolicy

  def index?
    user.has_role?(:superadmin) || user.has_role?(:admin)
  end
end
