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
class Message < ApplicationRecord
  belongs_to :message_recipient
  counter_culture :message_recipient

  validates :name, presence: true
  validates :email, presence: true
  validates :content, presence: true
  validates :message_recipient, presence: true
end
