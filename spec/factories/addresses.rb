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
#
FactoryBot.define do
  factory :address do
    name { "Place" }
    street { "123 Example St" }
    city { "City" }
    state { "NC" }
  end
end
