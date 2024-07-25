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
FactoryBot.define do
  factory :pilgrim_application do
    payment_method { "MyString" }
    payment_amount { "9.99" }

    association :pilgrim
    association :sponsor
  end
end
