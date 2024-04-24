# == Schema Information
#
# Table name: addresses
#
#  id         :uuid             not null, primary key
#  city       :string
#  country    :string           default("US")
#  latitude   :float
#  longitude  :float
#  name       :string
#  state      :string           default("NC")
#  street     :string
#  zip_code   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_addresses_on_latitude   (latitude)
#  index_addresses_on_longitude  (longitude)

class Address < ApplicationRecord
  has_many :events, dependent: :destroy

  validates :name, :street, :city, presence: true

  geocoded_by :address
  after_validation :geocode, if: :address_changed?

  def address
    [street, city, state, country].compact.join(', ')
  end

  def address_changed?
    street_changed? || city_changed? || state_changed?
  end
end
