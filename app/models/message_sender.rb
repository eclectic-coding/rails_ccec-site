# == Schema Information
#
# Table name: message_senders
#
#  id         :uuid             not null, primary key
#  email      :string
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class MessageSender < ApplicationRecord
  has_many :messages, dependent: :destroy

  validates :email, presence: true
  validates :name, presence: true
end
