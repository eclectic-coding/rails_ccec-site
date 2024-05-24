# == Schema Information
#
# Table name: sponsors
#
#  id                        :bigint           not null, primary key
#  alternative_phone         :string
#  church_reunion            :text
#  email                     :string
#  first_name                :string
#  followup                  :boolean          default(FALSE)
#  handicap_shower           :boolean          default(FALSE)
#  last_name                 :string
#  letter_min                :boolean          default(FALSE)
#  manage_stairs             :boolean          default(FALSE)
#  manage_top_bunk           :boolean          default(FALSE)
#  must_attend_events        :boolean          default(FALSE)
#  primary_phone             :string
#  reviewed_good_sponsor     :boolean          default(FALSE)
#  top_bunk_health           :text
#  understand_transportation :boolean          default(FALSE)
#  walking_ramp              :boolean          default(TRUE)
#  wheelchairs               :boolean          default(FALSE)
#  created_at                :datetime         not null
#  updated_at                :datetime         not null
#  pilgrim_application_id    :bigint           not null
#
# Indexes
#
#  index_sponsors_on_pilgrim_application_id  (pilgrim_application_id)
#
# Foreign Keys
#
#  fk_rails_...  (pilgrim_application_id => pilgrim_applications.id)
#
FactoryBot.define do
  factory :sponsor do
    first_name { "MyString" }
    last_name { "MyString" }
    email { "MyString" }
    primary_phone { "MyString" }
    alternative_phone { "MyString" }
    church_reunion { "MyText" }
    manage_stairs { false }
    walking_ramp { false }
    wheelchairs { false }
    handicap_shower { false }
    manage_top_bunk { false }
    top_bunk_health { "MyText" }
    reviewed_good_sponsor { false }
    understand_transportation { false }
    letter_min { false }
    must_attend_events { false }
    followup { false }
    pilgrim_application { nil }
  end
end
