# == Schema Information
#
# Table name: events
#
#  id                 :uuid             not null, primary key
#  description        :text
#  end_time           :datetime
#  event_type         :integer
#  name               :string
#  role               :string
#  start_time         :datetime
#  walk_number        :integer
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  connected_event_id :string
#
FactoryBot.define do
  factory :event do
    name { "MyString" }
    start_time { "2023-04-25 07:55:09" }
    role { "MyString" }

    trait :weekend do
      event_type { :weekend }
    end

    trait :follow_up do
      event_type { :followup }
    end
  end
end
