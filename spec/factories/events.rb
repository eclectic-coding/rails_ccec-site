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
#  address_id         :uuid
#  connected_event_id :string
#
# Indexes
#
#  index_events_on_address_id  (address_id)
#
# Foreign Keys
#
#  fk_rails_...  (address_id => addresses.id)
#
FactoryBot.define do
  factory :event do
    name { "MyString" }
    start_time { Time.zone.now }
    role { nil }

    trait :weekend do
      event_type { :weekend }
      walk_number { 111 }
    end

    trait :follow_up do
      event_type { :followup }
    end
  end
end
