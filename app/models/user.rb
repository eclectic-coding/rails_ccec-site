# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  admin                  :boolean          default(FALSE)
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  first_name             :string
#  invitation_accepted_at :datetime
#  invitation_created_at  :datetime
#  invitation_limit       :integer
#  invitation_sent_at     :datetime
#  invitation_token       :string
#  invitations_count      :integer          default(0)
#  invited_by_type        :string
#  last_name              :string
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  username               :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  account_id             :bigint
#  invited_by_id          :bigint
#
# Indexes
#
#  index_users_on_account_id            (account_id)
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_invitation_token      (invitation_token) UNIQUE
#  index_users_on_invited_by            (invited_by_type,invited_by_id)
#  index_users_on_invited_by_id         (invited_by_id)
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#  index_users_on_username              (username) UNIQUE
#
# Foreign Keys
#
#  fk_rails_...  (account_id => accounts.id)
#
class User < ApplicationRecord
  attr_writer :login

  rolify before_add: :before_add_method
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, registerable
  devise :invitable, :database_authenticatable, :rememberable, :validatable

  has_person_name

  belongs_to :account, optional: true
  has_many :account_users, dependent: :destroy
  has_many :accounts, through: :account_users

  accepts_nested_attributes_for :account_users

  before_save :add_account_id_from_parent
  after_create :create_account_user

  validates :name, presence: true
  validates :email, presence: true
  validates :username, presence: true, uniqueness: true
  validates :username, format: { with: /\A[a-zA-Z0-9_.]*\z/, multiline: true }

  def login
    @login || username || email
  end

  def add_account_id_from_parent
    self.account_id = Account.find_by(name: 'CCEC').id if account_id.nil?
  end

  def create_account_user
    AccountUser.create(account_id: account_id, user_id: id)
  end

  def profile_roles
    roles.map(&:human_name).join(', ')
  end

  def before_add_method(role)
    if roles.any?
      roles.clear
    end
  end

  def self.find_first_by_auth_conditions(warden_conditions)
    conditions = warden_conditions.dup
    if (login = conditions.delete(:login))
      where(conditions).where(['lower(username) = :value OR lower(email) = :value', { value: login.downcase }]).first
    elsif conditions[:username].nil?
      where(conditions).first
    else
      where(username: conditions[:username]).first
    end
  end
end
