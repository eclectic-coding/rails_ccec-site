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
#  walking_ramp              :boolean          default(FALSE)
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
class Sponsor < ApplicationRecord
  belongs_to :pilgrim_application

  has_person_name

  validates :name, :primary_phone, :reviewed_good_sponsor, :understand_transportation, :letter_min, :must_attend_events, :followup, presence: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }, allow_blank: true
  validates :primary_phone, format: { with: /\A\d{3}-\d{3}-\d{4}\z/ }
end
