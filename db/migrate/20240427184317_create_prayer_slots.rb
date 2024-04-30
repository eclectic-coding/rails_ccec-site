class CreatePrayerSlots < ActiveRecord::Migration[7.1]
  def change
    create_table :prayer_slots do |t|
      t.datetime :start_time
      t.datetime :end_time
      t.references :prayer_vigil, null: false, foreign_key: true

      t.timestamps
    end
  end
end
