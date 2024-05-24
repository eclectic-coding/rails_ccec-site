class CreatePilgrims < ActiveRecord::Migration[7.1]
  def change
    create_table :pilgrims do |t|
      t.string :first_name
      t.string :middle_name
      t.string :last_name
      t.string :street_address
      t.string :city
      t.string :state
      t.string :zipcode
      t.string :primary_phone
      t.string :alternative_phone
      t.string :work_phone
      t.string :email
      t.datetime :date_birth
      t.string :gender
      t.string :occupation
      t.string :nametag_name
      t.boolean :clergy, default: false
      t.boolean :musician, default: false
      t.string :emergency_name
      t.string :emergency_relationship
      t.string :emergency_city
      t.string :emergency_primary_phone
      t.string :emergency_alternative_phone
      t.string :health_condition
      t.string :physical_limitations
      t.boolean :medication_time, default: false
      t.text :allergies
      t.text :walk_explained
      t.boolean :followup_activities, default: false
      t.text :short_notice
      t.references :pilgrim_application, null: false, foreign_key: true

      t.timestamps
    end
  end
end
