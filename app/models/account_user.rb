# frozen_string_literal: true

# == Schema Information
#
# Table name: account_users
#
#  id         :uuid             not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  account_id :uuid             not null
#  user_id    :uuid             not null
#
# Indexes
#
#  index_account_users_on_account_id  (account_id)
#  index_account_users_on_user_id     (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (account_id => accounts.id)
#  fk_rails_...  (user_id => users.id)

class AccountUser < ApplicationRecord
  belongs_to :account
  belongs_to :user, dependent: :destroy

  attribute :email, :string
  attribute :name, :string
  attribute :role_id, :string

  before_validation :set_user_id, if: :email?
  after_create :set_role

  def set_user_id
    self.user = User.invite!(email: email, name: name)
  end

  def set_role
    user.add_role(Role.find(role_id).name)
  end
end
