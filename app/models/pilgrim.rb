# == Schema Information
#
# Table name: pilgrims
#
#  id                          :bigint           not null, primary key
#  allergies                   :text
#  alternative_phone           :string
#  city                        :string
#  clergy                      :boolean          default(FALSE)
#  date_birth                  :datetime
#  email                       :string
#  emergency_alternative_phone :string
#  emergency_city              :string
#  emergency_name              :string
#  emergency_primary_phone     :string
#  emergency_relationship      :string
#  first_name                  :string
#  followup_activities         :boolean          default(FALSE)
#  gender                      :string
#  health_condition            :string
#  last_name                   :string
#  medication_time             :boolean          default(FALSE)
#  middle_name                 :string
#  musician                    :boolean          default(FALSE)
#  nametag_name                :string
#  occupation                  :string
#  physical_limitations        :string
#  primary_phone               :string
#  short_notice                :text
#  state                       :string
#  street_address              :string
#  walk_explained              :text
#  work_phone                  :string
#  zipcode                     :string
#  created_at                  :datetime         not null
#  updated_at                  :datetime         not null
#  pilgrim_application_id      :bigint           not null
#
# Indexes
#
#  index_pilgrims_on_pilgrim_application_id  (pilgrim_application_id)
#
# Foreign Keys
#
#  fk_rails_...  (pilgrim_application_id => pilgrim_applications.id)
#
class Pilgrim < ApplicationRecord
  belongs_to :pilgrim_application
  has_many :churches

  validates :first_name, :last_name, :date_birth, :gender, :street_address, :city, :state,
            :zipcode, :primary_phone, presence: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :primary_phone, format: { with: /\A\d{3}-\d{3}-\d{4}\z/ }

  accepts_nested_attributes_for :churches, allow_destroy: true
end
