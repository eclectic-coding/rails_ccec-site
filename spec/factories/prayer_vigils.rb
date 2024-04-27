# == Schema Information
#
# Table name: prayer_vigils
#
#  id         :bigint           not null, primary key
#  end_time   :datetime
#  start_time :datetime
#  title      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
FactoryBot.define do
  factory :prayer_vigil do
    title { "MyString" }
    start_time { "2024-04-27 14:37:49" }
    end_time { "2024-04-27 14:37:49" }
  end
end
