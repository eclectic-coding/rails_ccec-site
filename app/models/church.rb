# == Schema Information
#
# Table name: churches
#
#  id             :bigint           not null, primary key
#  church_email   :string
#  city           :string
#  name           :string
#  pastor         :string
#  phone          :string
#  state          :string
#  street_address :string
#  zipcode        :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  pilgrim_id     :bigint           not null
#
# Indexes
#
#  index_churches_on_pilgrim_id  (pilgrim_id)
#
# Foreign Keys
#
#  fk_rails_...  (pilgrim_id => pilgrims.id)
#
class Church < ApplicationRecord
  belongs_to :pilgrim

  validates :church_email, format: { with: URI::MailTo::EMAIL_REGEXP }, allow_blank: true
end
