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
FactoryBot.define do
  factory :pilgrim do
    first_name { "First" }
    middle_name { "Middle" }
    last_name { "Last" }
    street_address { "123 MyString St" }
    city { "MyString" }
    state { "NC" }
    zipcode { "28451" }
    primary_phone { "MyString" }
    alternative_phone { "MyString" }
    work_phone { "MyString" }
    email { "MyString" }
    date_birth { "2024-05-24 10:42:31" }
    gender { "MyString" }
    occupation { "MyString" }
    nametag_name { "MyString" }
    clergy { false }
    musician { false }
    emergency_name { "MyString" }
    emergency_relationship { "MyString" }
    emergency_city { "MyString" }
    emergency_primary_phone { "MyString" }
    emergency_alternative_phone { "MyString" }
    health_condition { "MyString" }
    physical_limitations { "MyString" }
    medication_time { false }
    allergies { "MyText" }
    walk_explained { "MyText" }
    followup_activities { false }
    short_notice { "MyText" }
    pilgrim_application { nil }
  end
end
