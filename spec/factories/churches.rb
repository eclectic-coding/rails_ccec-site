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
FactoryBot.define do
  factory :church do
    name { "MyString" }
    phone { "MyString" }
    street_address { "MyString" }
    city { "MyString" }
    state { "MyString" }
    zipcode { "MyString" }
    pastor { "MyString" }
    church_email { "MyString" }
  end
end
