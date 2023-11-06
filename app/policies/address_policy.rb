class AddressPolicy < ApplicationPolicy
  attr_reader :user, :address

  def initialize(user, address)
    @user = user
    @address = address
  end

  def index?
    @user.has_role?(:superadmin) || @user.has_role?(:admin)
  end

  def show?
    @user.has_role?(:superadmin) || @user.has_role?(:admin)
  end

  def new?
    @user.has_role?(:superadmin) || @user.has_role?(:admin)
  end
end
