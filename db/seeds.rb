# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
puts "\n== Seeding database =="
DatabaseSeederJob.perform_now

require 'faker'

10.times do
  Message.create!(
    name: Faker::Name.name,
    email: Faker::Internet.email,
    content: Faker::Lorem.paragraph(sentence_count: 2),
    message_recipient_id: MessageRecipient.first.id
  )
end
#
10.times do
  Message.create!(
    name: Faker::Name.name,
    email: Faker::Internet.email,
    content: Faker::Lorem.paragraph(sentence_count: 2),
    message_recipient_id: MessageRecipient.second.id
  )
end
