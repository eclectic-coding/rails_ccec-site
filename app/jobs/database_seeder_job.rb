# frozen_string_literal: true

class DatabaseSeederJob < ApplicationJob
  queue_as :default

  DEFAULT_ADMIN_EMAIL = "admin@example.com"
  DEFAULT_ADMIN_PASSWORD = "Mysecret+1234"

  def perform
    ActiveRecord::Base.transaction do
      create_account
      create_admin_user
      add_admin_role
    end
  end

  private

  def create_account
    Account.create!(name: "CCEC")
  end

  def create_admin_user
    User.create!(
      email: DEFAULT_ADMIN_EMAIL,
      password: DEFAULT_ADMIN_PASSWORD,
      password_confirmation: DEFAULT_ADMIN_PASSWORD,
      admin: true
    )
  end

  def add_admin_role
    User.find_by(email: DEFAULT_ADMIN_EMAIL).add_role(:admin)
  end
end
