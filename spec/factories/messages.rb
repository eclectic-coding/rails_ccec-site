# == Schema Information
#
# Table name: messages
#
#  id                   :bigint           not null, primary key
#  content              :text
#  email                :string
#  name                 :string
#  request_copy         :boolean          default(FALSE)
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#  message_recipient_id :bigint           not null
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
    message_recipient
    name { "John Doe" }
    email { "message@example.com" }
    content { "MyText" }
    request_copy { false }
  end
end
