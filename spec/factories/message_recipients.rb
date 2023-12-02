# == Schema Information
#
# Table name: message_recipients
#
#  id         :uuid             not null, primary key
#  email      :string
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
FactoryBot.define do
  factory :message_recipient do
    name { "MyString" }
    email { "MyString" }
  end
end
