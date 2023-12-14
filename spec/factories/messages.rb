# == Schema Information
#
# Table name: messages
#
#  id                   :uuid             not null, primary key
#  content              :text
#  email                :string
#  messages_count       :integer          default(0)
#  name                 :string
#  request_copy         :boolean          default(FALSE)
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#  message_recipient_id :uuid             not null
#
# Indexes
#
#  index_messages_on_message_recipient_id  (message_recipient_id)
#
# Foreign Keys
#
#  fk_rails_...  (message_recipient_id => message_recipients.id)
#
FactoryBot.define do
  factory :message do
    message_recipient { nil }
    name { "John Doe" }
    email { "message@example.com" }
    content { "MyText" }
    request_copy { false }
  end
end
