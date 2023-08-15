# frozen_string_literal: true

class DatabaseSeederJob < ApplicationJob
  queue_as :default

  DEFAULT_ADMIN_EMAIL = "admin@example.com"
  DEFAULT_ADMIN_PASSWORD = "Mysecret+1234"
  DEFAULT_MEMBER_EMAIL = "member@example.com"
  DEFAULT_MEMBER_PASSWORD = "Mysecret+1234"

  def perform
    ActiveRecord::Base.transaction do
      create_roles
      create_account
      create_admin_user
      add_roles
    end
  end

  private

  def create_roles
    %w[superadmin admin member prayer].each do |role_name|
      Role.create! name: role_name
    end
  end

  def create_account
    Account.create!(name: "CCEC")
  end

  def create_member_user
    User.create!(
      name: "Admin User",
      email: DEFAULT_MEMBER_EMAIL,
      password: DEFAULT_MEMBER_PASSWORD,
      password_confirmation: DEFAULT_MEMBER_PASSWORD,
      admin: false
    )
  end

  def create_admin_user
    User.create!(
      name: "Admin User",
      email: DEFAULT_ADMIN_EMAIL,
      password: DEFAULT_ADMIN_PASSWORD,
      password_confirmation: DEFAULT_ADMIN_PASSWORD,
      admin: true
    )
  end

  def add_roles
    User.find_by(email: DEFAULT_ADMIN_EMAIL).add_role(:superadmin)
    User.find_by(email: DEFAULT_MEMBER_EMAIL).add_role(:member)
  end
end
