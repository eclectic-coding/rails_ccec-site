# == Schema Information
#
# Table name: addresses
#
#  id         :uuid             not null, primary key
#  city       :string
#  name       :string
#  state      :string           default("NC")
#  street     :string
#  zip_code   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Address < ApplicationRecord
  has_many :events, dependent: :destroy

  validates :name, :street, :city, :state, presence: true
end
