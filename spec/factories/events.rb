# == Schema Information
#
# Table name: events
#
#  id         :uuid             not null, primary key
#  end_time   :datetime
#  event_type :integer
#  name       :string
#  recurring  :text
#  role       :string
#  start_time :datetime
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
FactoryBot.define do
  factory :event do
    name { "MyString" }
    start_time { "2023-04-25 07:55:09" }
    recurring { "MyText" }
    role { "MyString" }
    end_time { "2023-04-25 07:55:09" }
    type { 1 }
  end
end
