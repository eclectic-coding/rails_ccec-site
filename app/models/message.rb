# == Schema Information
#
# Table name: messages
#
#  id                   :uuid             not null, primary key
#  content              :text
#  request_copy         :boolean
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#  message_recipient_id :uuid
#  message_sender_id    :uuid
#
# Indexes
#
#  index_messages_on_message_recipient_id  (message_recipient_id)
#  index_messages_on_message_sender_id     (message_sender_id)
#
# Foreign Keys
#
#  fk_rails_...  (message_recipient_id => message_recipients.id)
#  fk_rails_...  (message_sender_id => message_senders.id)
#
class Message < ApplicationRecord
  belongs_to :message_recipient
  belongs_to :message_sender

  validates :content, presence: true
end
