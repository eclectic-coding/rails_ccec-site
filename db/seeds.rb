# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
puts "\n== Seeding database =="
# DatabaseSeederJob.perform_now

DEFAULT_ADMIN_EMAIL = "admin@example.com"
DEFAULT_ADMIN_PASSWORD = "Mysecret+1234"
DEFAULT_MEMBER_EMAIL = "member@example.com"
DEFAULT_MEMBER_PASSWORD = "Mysecret+1234"

%w[superadmin admin member prayer].each do |role_name|
  Role.create! name: role_name
end

Account.create!(name: "CCEC")

User.create!(
  name: "Member User",
  username: "member_user",
  email: DEFAULT_MEMBER_EMAIL,
  password: DEFAULT_MEMBER_PASSWORD,
  password_confirmation: DEFAULT_MEMBER_PASSWORD,
  admin: false
)

User.create!(
  name: "Admin User",
  username: "admin_user",
  email: DEFAULT_ADMIN_EMAIL,
  password: DEFAULT_ADMIN_PASSWORD,
  password_confirmation: DEFAULT_ADMIN_PASSWORD,
  admin: true
)

User.find_by(email: DEFAULT_ADMIN_EMAIL).add_role(:superadmin)
User.find_by(email: DEFAULT_MEMBER_EMAIL).add_role(:member)

Address.create!(name: "Pine Valley Methodist Church", street: "3788 Shipyard Blvd", city: "Wilmington")
Address.create!(name: "First Christian Church", street: "124 Trott Rd", city: "Richlands")
Address.create!(name: "Salt and Light Center", street: "2006 Wicker St", city: "North Topsail Beach")

ActsAsTaggableOn::Tag.create!(name: "Documents")
ActsAsTaggableOn::Tag.create!(name: "Rosters")
