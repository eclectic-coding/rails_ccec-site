# == Schema Information
#
# Table name: prayer_vigils
#
#  id          :bigint           not null, primary key
#  end_time    :datetime
#  slug        :string
#  start_time  :datetime
#  title       :string
#  walk_number :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
# Indexes
#
#  index_prayer_vigils_on_slug  (slug) UNIQUE
#
FactoryBot.define do
  factory :prayer_vigil do
    title { "MyString" }
    start_time { "2024-04-27 14:37:49" }
    end_time { "2024-04-27 14:37:49" }
    walk_number { 1 }
  end
end
