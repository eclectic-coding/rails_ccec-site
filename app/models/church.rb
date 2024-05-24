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
#
class Church < ApplicationRecord
end
