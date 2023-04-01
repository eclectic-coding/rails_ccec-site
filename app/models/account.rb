# == Schema Information
#
# Table name: accounts
#
#  id         :bigint           not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Account < ApplicationRecord
  has_many :users, dependent: :destroy
  validates :name, presence: true
end
