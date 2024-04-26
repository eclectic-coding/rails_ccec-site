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
class MessageRecipient < ApplicationRecord
  has_many :messages, dependent: :destroy
  accepts_nested_attributes_for :messages

  validates :email, presence: true
  validates :name, presence: true
end
