class User < ApplicationRecord
  attribute :account_id, :integer, default: -> { Account.first.id }
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable

  rolify
  has_person_name

  belongs_to :account, optional: true
end
