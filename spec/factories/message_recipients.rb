# == Schema Information
#
# Table name: message_recipients
#
#  id             :bigint           not null, primary key
#  email          :string
#  messages_count :integer          default(0), not null
#  name           :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#
FactoryBot.define do
  factory :message_recipient do
    name { "Info" }
    email { "user1@example.com" }
  end
end
