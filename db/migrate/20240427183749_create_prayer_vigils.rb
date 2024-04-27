class CreatePrayerVigils < ActiveRecord::Migration[7.1]
  def change
    create_table :prayer_vigils do |t|
      t.string :title
      t.datetime :start_time
      t.datetime :end_time

      t.timestamps
    end
  end
end
