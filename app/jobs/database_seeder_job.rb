# frozen_string_literal: true

require "faker" if Rails.env.development?

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
      create_member_user
      add_roles
      create_addresses
      create_tags
      create_message_recipients
      # create_messages # This is commented out its for testing only.
      create_editables
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
      name: "Member User",
      username: "member_user",
      email: DEFAULT_MEMBER_EMAIL,
      password: DEFAULT_MEMBER_PASSWORD,
      password_confirmation: DEFAULT_MEMBER_PASSWORD,
      admin: false
    )
  end

  def create_admin_user
    User.create!(
      name: "Admin User",
      username: "admin_user",
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

  def create_addresses
    Address.create!(name: "Pine Valley Methodist Church", street: "3788 Shipyard Blvd", city: "Wilmington")
    Address.create!(name: "First Christian Church", street: "124 Trott Rd", city: "Richlands")
    Address.create!(name: "Salt and Light Center", street: "2006 Wicker St", city: "North Topsail Beach")
    Address.create!(name: "Faith Harbor UMC", street: "14201 NC-50", city: "Surf City")
  end

  def create_tags
    ActsAsTaggableOn::Tag.create!(name: "Documents")
    ActsAsTaggableOn::Tag.create!(name: "Rosters")
  end

  def create_message_recipients
    MessageRecipient.create!(name: "Registration", email: "registrar@example.com")
    MessageRecipient.create!(name: "Information", email: "info@example.com")
  end

  def create_messages
    10.times do
      Message.create!(
        name: Faker::Name.name,
        email: Faker::Internet.email,
        content: Faker::Lorem.paragraph(sentence_count: 2),
        message_recipient_id: MessageRecipient.first.id
      )
    end

    10.times do
      Message.create!(
        name: Faker::Name.name,
        email: Faker::Internet.email,
        content: Faker::Lorem.paragraph(sentence_count: 2),
        message_recipient_id: MessageRecipient.second.id
      )
    end
  end
end
