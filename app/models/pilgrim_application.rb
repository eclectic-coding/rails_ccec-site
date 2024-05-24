# == Schema Information
#
# Table name: pilgrim_applications
#
#  id             :bigint           not null, primary key
#  payment_amount :decimal(, )
#  payment_method :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#
class PilgrimApplication < ApplicationRecord
  has_many :pilgrims
  has_many :churches, through: :pilgrims
  has_many :sponsors
end
