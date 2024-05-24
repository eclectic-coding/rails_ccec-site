class CreateSponsors < ActiveRecord::Migration[7.1]
  def change
    create_table :sponsors do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :primary_phone
      t.string :alternative_phone
      t.text :church_reunion
      t.boolean :manage_stairs, default: false
      t.boolean :walking_ramp, default: true
      t.boolean :wheelchairs, default: false
      t.boolean :handicap_shower, default: false
      t.boolean :manage_top_bunk, default: false
      t.text :top_bunk_health
      t.boolean :reviewed_good_sponsor, default: false
      t.boolean :understand_transportation, default: false
      t.boolean :letter_min, default: false
      t.boolean :must_attend_events, default: false
      t.boolean :followup, default: false
      t.references :pilgrim_application, null: false, foreign_key: true

      t.timestamps
    end
  end
end
